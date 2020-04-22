namespace APISPFX_MODEL.Requests.UserRequest
{
  public class UserSearchRequest
  {
    public class RootObject
    {
      public UserSearch UserSearch { get; set; }
    }

    public class UserSearch
    {
      public virtual string FirstName { get; set; }
      public virtual string LastName { get; set; }
      public virtual string Phone { get; set; }
      public virtual long IdLocation { get; set; }
      public virtual string LocationName { get; set; }
    }
  }
}
