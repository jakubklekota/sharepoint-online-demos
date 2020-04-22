namespace APISPFX_MODEL.Requests.LocationRequest
{
  public class LocationCreateRequest
  {
    public class RootObject
    {
      public virtual LocationCreate LocationCreate { get; set; }
    }

    public class LocationCreate
    {
      public string Name { get; set; }
    }
  }
}
