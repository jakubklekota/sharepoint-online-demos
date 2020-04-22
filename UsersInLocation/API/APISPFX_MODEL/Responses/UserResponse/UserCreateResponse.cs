namespace APISPFX_MODEL.Responses.UserResponse
{
  public class UserCreateResponse
  {
    public class RootObject
    {
      public virtual bool Created { get; set; }
      public virtual string ErrorMsg { get; set; }
      public virtual UserCreate UserCreate { get; set; }
    }

    public class UserCreate
    {
      public virtual long Id { get; set; }
      public virtual string FirstName { get; set; }
      public virtual string LastName { get; set; }
      public virtual string Phone { get; set; }
      public virtual long IdLocation { get; set; }
      public virtual long LocationName { get; set; }
    }
  }
}
