namespace APISPFX_MODEL.Responses.UserResponse
{
  public class UserSearchResponse
  {
    public class RootObject
    {
      public virtual UserSearch UserSearch { get; set; }
    }

    public class UserSearch
    {
      public long Id { get; set; }
      public string FirstName { get; set; }
      public string LastName { get; set; }
      public string Phone { get; set; }
      public long IdLocation { get; set; }
      public string LocationName { get; set; }
    }
  }
}
