namespace APISPFX_MODEL.Models.RelationModel
{
  public class UserLocationRelationLocationModel : BaseModel
  {
    public long IdUser { get; set; }
    public long IdLocation { get; set; }

    public string LocationName { get; set; }
  }
}
