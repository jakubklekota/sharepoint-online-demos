using System.Collections.Generic;

namespace APISPFX_MODEL.Responses.UserResponse
{
  public class UserDeleteResponse
  {
    public class RootObject
    {
      public bool Deleted { get; set; }
      public string ErrorMsg { get; set; }
      public virtual List<UserDelete> UserDelete { get; set; }
    }

    public class UserDelete
    {
      public long Id { get; set; }
    }
  }
}
