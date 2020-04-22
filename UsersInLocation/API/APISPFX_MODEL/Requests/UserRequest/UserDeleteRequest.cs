namespace APISPFX_MODEL.Requests.UserRequest
{
  public class UserDeleteRequest
  {
    public class RootObject
    {
      public virtual UserDelete[] UserDelete { get; set; }
    }

    public class UserDelete
    {
      public long Id { get;set; }
    }

  }
}
