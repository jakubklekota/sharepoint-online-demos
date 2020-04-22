using System.Collections.Generic;

namespace APISPFX_MODEL.Responses.LocationResponse
{
  public class LocationDeleteResponse
  {
    public class RootObject
    {
      public bool Deleted { get; set; }
      public string ErrorMsg { get; set; }

      public virtual List<LocationDelete> LocationDelete { get; set; }
    }

    public class LocationDelete
    {
      public long Id { get; set; }
    }
  }
}
