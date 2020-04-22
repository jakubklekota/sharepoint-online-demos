namespace APISPFX_MODEL.Responses.LocationResponse
{
  public class LocationCreateResponse
  {
    public class RootObject
    {
      public virtual bool Created { get; set; }
      public virtual string ErrorMsg { get; set; }
      public virtual LocationCreate LocationCreate { get; set; }
    }

    public class LocationCreate
    {
      public virtual long Id { get; set; }
      public virtual string Name { get; set; }
    }
  }
}
