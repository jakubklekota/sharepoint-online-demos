namespace APISPFX_MODEL.Responses.HomeResponse
{
  public class UserInLocationResponse
  {
    public class RootObject
    {
      public bool Success { get; set; }
      public string ErrorMsg { get; set; }
      public virtual UserInLocation UserInLocation { get; set; }

    }
    public class UserInLocation
    {
      public string LocationName { get; set; }
      public int UserCount { get; set; }
    }
  }
}
