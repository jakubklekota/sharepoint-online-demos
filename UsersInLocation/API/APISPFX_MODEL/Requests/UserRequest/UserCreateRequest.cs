namespace APISPFX_MODEL.Requests.UserRequest
{
  public class UserCreateRequest
  {
    public class RootObject
    {
      public virtual UserCreate UserCreate { get; set; }
    }

    public class UserCreate
    {
      public virtual string FirstName { get; set; }
      public virtual string LastName { get; set; }
      public virtual string Phone { get; set; }
      public virtual long IdLocation { get; set; }
      public virtual string LocationName { get; set; }
    }
  }
}
