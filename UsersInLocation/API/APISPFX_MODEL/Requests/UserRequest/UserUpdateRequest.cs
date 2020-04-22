namespace APISPFX_MODEL.Requests.UserRequest
{
  public class UserUpdateRequest
  {
    public class RootObject
    {
      public virtual UserUpdate UserUpdate { get; set; }
    }

    public class UserUpdate
    {
      public long Id { get; set; }
      public string FirstName { get; set; }
      public string LastName { get; set; }
      public string Phone { get; set; }
      public long IdLocation { get; set; }
    }
  }
}
