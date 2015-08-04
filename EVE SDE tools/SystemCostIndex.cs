using Microsoft.SqlServer.Server;
using Newtonsoft.Json.Linq;
using System.Data.SqlTypes;
using System.Linq;
using System.Net;


public partial class UserDefinedFunctions
{
    [SqlFunction]
    public static SqlDouble SystemCostIndex(int systemId, string systemName, int activityId)
    {
        string systems;
        using (WebClient client = new WebClient())
        {
            systems = client.DownloadString("http://public-crest.eveonline.com/industry/systems/");
        }

        var systemsIndexes = JObject.Parse(systems);

        var systemIndexes = (from sys in systemsIndexes["items"]
                             where ((string)(sys["solarSystem"]["name"]) == systemName) || ((int)(sys["solarSystem"]["id"]) == systemId)
                             select sys["systemCostIndices"]);

        return new SqlDouble((double)(from idx in systemIndexes.Values()
                                      where (int)(idx["activityID"]) == activityId
                                      select idx["costIndex"]).FirstOrDefault());
    }
}