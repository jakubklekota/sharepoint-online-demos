namespace APISPFX_MODEL.Requests.LocationRequest
{
  public class LocationUpdateRequest
  {
    public class RootObject
    {
      public virtual LocationUpdate LocationUpdate { get; set; }
    }

    public class LocationUpdate
    {
      public long Id { get; set; }
      public string Name { get; set; }
    }
  }
}
