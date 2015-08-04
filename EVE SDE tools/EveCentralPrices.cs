using Microsoft.SqlServer.Server;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Net;
using System.Xml;

public static class PagingExtensions
{
    //used by LINQ to SQL
    public static IQueryable<TSource> Page<TSource>(this IQueryable<TSource> source, int page, int pageSize)
    {
        return source.Skip(page * pageSize).Take(pageSize);
    }

    //used by LINQ
    public static IEnumerable<TSource> Page<TSource>(this IEnumerable<TSource> source, int page, int pageSize)
    {
        return source.Skip(page * pageSize).Take(pageSize);
    }

}

public partial class UserDefinedFunctions
{
    internal class PriceDatum
    {
        internal class Price
        {
            public Price(XmlNode xmlPrice)
            {
                volume = Convert.ToInt64(xmlPrice.SelectSingleNode("volume").InnerText);
                max = Convert.ToDouble(xmlPrice.SelectSingleNode("max").InnerText);
                min = Convert.ToDouble(xmlPrice.SelectSingleNode("min").InnerText);
                median = Convert.ToDouble(xmlPrice.SelectSingleNode("median").InnerText);
                percentile = Convert.ToDouble(xmlPrice.SelectSingleNode("percentile").InnerText);
                mean = Convert.ToDouble(xmlPrice.SelectSingleNode("avg").InnerText);
                stdDev = Convert.ToDouble(xmlPrice.SelectSingleNode("stddev").InnerText);
            }

            public long volume { get; private set; }
            public double max { get; private set; }
            public double min { get; private set; }
            public double median { get; private set; }
            public double percentile { get; private set; }
            public double mean { get; private set; }
            public double stdDev { get; private set; }
        }

        public PriceDatum(XmlNode xmlItem)
        {
            XmlNode xmlBuy = xmlItem.SelectSingleNode("buy");
            XmlNode xmlSell = xmlItem.SelectSingleNode("sell");
            XmlNode xmlAll = xmlItem.SelectSingleNode("all");

            itemId = Convert.ToInt32(xmlItem.Attributes["id"].Value);
            Buy = new Price(xmlBuy);
            Sell = new Price(xmlSell);
            All = new Price(xmlAll);
        }

        private Price Buy { get; set; }
        private Price Sell { get; set; }
        private Price All { get; set; }

        public int itemId { get; private set; }
        public long volume { get { return Buy.volume > 0 ? Buy.volume : Sell.volume; } }
        public double maxBuy { get { return Buy.volume > 0 ? Buy.max : Sell.min; } }
        public double minSell { get { return Sell.volume > 0 ? Sell.min : Buy.max; } }
        public double medianBuy { get { return Buy.volume > 0 ? Buy.median : All.median; } }
        public double medianSell { get { return Sell.volume > 0 ? Sell.median : All.median; } }
        public double percentileBuy { get { return Buy.volume > 0 ? Buy.percentile : Sell.min; } }
        public double percentileSell { get { return Sell.volume > 0 ? Sell.percentile : Buy.max; } }
    }

    [SqlFunction(
        FillRowMethodName = "FillMarketPrice",
        TableDefinition = "itemId int, volume bigint, buy money, sell money",
        SystemDataAccess = SystemDataAccessKind.Read,
        DataAccess = DataAccessKind.Read)]
    public static IEnumerable EveCentralPrices()
    {
        var ids = new List<int>(GetTypeIdsFromTemp());
        var pages = PaginateTypeIds(ids);
        var xmlMarketPrices = GetPricesFromEVECentral(pages);
        return ParseXMLPrices(xmlMarketPrices);
    }

    private static IEnumerable ParseXMLPrices(IEnumerable<XmlNode> xmlMarketPrices)
    {
        return from XmlNode MarketPrices in xmlMarketPrices
               from XmlNode xmlItem in MarketPrices.SelectNodes("/evec_api/marketstat/type")
               let xmlPrice = new PriceDatum(xmlItem)
               select xmlPrice;
    }

    private static IEnumerable<XmlNode> GetPricesFromEVECentral(IEnumerable<string> pages)
    {
        using (WebClient client = new WebClient())
        {
            foreach (string page in pages)
            {
                string marketPrices;
                string query = "http://api.eve-central.com/api/marketstat?" + page + "&usesystem=30000142";
                try
                {
                    marketPrices = client.DownloadString(query);
                }
                catch (WebException)
                {
                    using (StreamWriter file = new StreamWriter("D:\\Desktop\\badUrls.txt", true))
                    {
                        file.WriteLine(query);
                    }
                    continue;
                }

                XmlDocument xmlMarketPrices = new XmlDocument();

                xmlMarketPrices.LoadXml(marketPrices);

                yield return xmlMarketPrices;
            }
        }
    }

    private static IEnumerable<string> PaginateTypeIds(IEnumerable<int> ids)
    {
        const int pageSize = 50;
        int pages = ids.Count() / pageSize;   

        for (int i = 0; i <= pages; ++i)
        {
            yield return string.Join("&", from int id in ids.Page(i, pageSize)
                                          let typeId = "typeid=" + id
                                          select typeId);
        }
    }

    private static IEnumerable<int> GetTypeIdsFromTemp()
    {
        using (SqlConnection connection = new SqlConnection("context connection=true"))
        {
            connection.Open();
            SqlCommand getMaterialIds = new SqlCommand("SELECT DISTINCT typeId FROM #MatReq WHERE typeId IS NOT NULL", connection);

            SqlDataReader materialIds = getMaterialIds.ExecuteReader();

            while (materialIds.Read())
            {
                yield return materialIds.GetInt32(0);
            }
        }
    }

    public static void FillMarketPrice(Object obj, out SqlInt32 itemId, out SqlInt64 volume, out SqlMoney buy, out SqlMoney sell)
    {
        PriceDatum Item = (PriceDatum)obj;
        itemId = new SqlInt32(Item.itemId);
        volume = new SqlInt64(Item.volume);
        buy = new SqlMoney(Item.percentileBuy);
        sell = new SqlMoney(Item.percentileSell);
    }
}