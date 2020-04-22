namespace APISPFX_MODEL.Requests.LocationRequest
{
  public class LocationSearchRequest
  {
    public class RootObject
    {
      public virtual LocationSearch LocationSearch { get; set; }
    }

    public class LocationSearch
    {
      public string Name { get; set; }
    }
  }
}
