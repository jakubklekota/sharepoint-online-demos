namespace APISPFX_MODEL.Requests.LocationRequest
{
  public class LocationDeleteRequest
  {
    public class RootObject
    {
      public virtual LocationDelete[] LocationDelete { get; set; }
    }

    public class LocationDelete
    {
      public long Id { get; set; }
    }
  }
}
