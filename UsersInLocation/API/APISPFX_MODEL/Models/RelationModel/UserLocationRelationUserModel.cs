namespace APISPFX_MODEL.Models.RelationModel
{
  public class UserLocationRelationUserModel : BaseModel
  {
    public long IdUser { get; set; }
    public long IdLocation { get; set; }

    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Phone { get; set; }
    public string LocationName { get; set; }
  }
}
