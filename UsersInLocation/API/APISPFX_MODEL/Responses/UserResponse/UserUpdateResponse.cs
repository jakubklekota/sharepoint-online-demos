namespace APISPFX_MODEL.Responses.UserResponse
{
  public class UserUpdateResponse
  {
    public class RootObject
    {
      public bool Updated { get; set; }
      public string ErrorMsg { get; set; }
      public virtual UserUpdate UserUpdate { get; set; }
    }

    public class UserUpdate
    {
      public virtual string FirstName { get; set; }
      public virtual string LastName { get; set; }
      public virtual string Phone { get; set; }
      public virtual long IdLocation { get; set; }
    }
  }
}
