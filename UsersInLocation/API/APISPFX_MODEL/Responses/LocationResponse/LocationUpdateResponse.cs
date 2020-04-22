namespace APISPFX_MODEL.Responses.LocationResponse
{
  public class LocationUpdateResponse
  {
    public class RootObject
    {
      public bool Updated { get; set; }
      public string ErrorMsg { get; set; }
      public virtual LocationUpdate LocationUpdate { get; set; }
    }

    public class LocationUpdate
    {
      public long Id { get; set; }
      public string Name { get; set; }
    }
  }
}
