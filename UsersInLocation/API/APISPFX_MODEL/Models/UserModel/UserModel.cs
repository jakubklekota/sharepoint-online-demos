namespace APISPFX_MODEL.Models.UserModel
{
  public class UserModel : BaseModel
  {
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Phone { get; set; }
    public long IdLocation { get; set; }
    public string LocationName { get; set; }
  }
}
