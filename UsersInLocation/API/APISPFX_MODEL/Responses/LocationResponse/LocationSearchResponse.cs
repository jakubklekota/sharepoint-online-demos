namespace APISPFX_MODEL.Responses.LocationResponse
{
  public class LocationSearchResponse
  {
    public class RootObject
    {
      public virtual LocationSearch LocationSearch { get; set; }
    }

    public class LocationSearch
    {
      public long Id { get; set; }
      public string Name { get; set; }
    }
  }
}
