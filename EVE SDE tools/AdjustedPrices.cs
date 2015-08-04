using Microsoft.SqlServer.Server;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Data.SqlTypes;
using System.Linq;
using System.Net;

public partial class UserDefinedFunctions
{
    internal class CCPDatum
    {
        public float adjustedPrice { get; set; }
        public float? averagePrice { get; set; }
        public int item_id { get; set; }
        public string item_name { get; set; }
    }

    [SqlFunction(FillRowMethodName = "FillAdjustedPrice", TableDefinition = "itemId int, adjustedPrice money, averagePrice money, itemName nvarchar(100)")]
    public static IEnumerable AdjustedPrices()
    {
        using (WebClient client = new WebClient())
        {
            string marketPrices = client.DownloadString("http://public-crest.eveonline.com/market/prices/");

            var CCPMarketData = JObject.Parse(marketPrices);

            return CCPMarketData["items"].Select(item => new CCPDatum
            {
                adjustedPrice = (float)item["adjustedPrice"],
                averagePrice = (float?)item["averagePrice"],
                item_id = (int)item["type"]["id"],
                item_name = (string)item["type"]["name"]
            });
        }
    }

    public static void FillAdjustedPrice(Object obj, out SqlInt32 itemId, out SqlMoney adjustedPrice, out SqlMoney averagePrice, out SqlChars itemName)
    {
        CCPDatum Item = (CCPDatum)obj;
        itemId = new SqlInt32(Item.item_id);
        adjustedPrice = new SqlMoney(Item.adjustedPrice);
        averagePrice = Item.averagePrice.HasValue ? new SqlMoney(Item.averagePrice.Value) : SqlMoney.Null;
        itemName = new SqlChars(Item.item_name);
    }
}