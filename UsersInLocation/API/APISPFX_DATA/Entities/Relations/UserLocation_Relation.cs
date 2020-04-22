using APISPFX_DATA.Base;
using APISPFX_DATA.Entities.Locations;
using APISPFX_DATA.Entities.Users;

namespace APISPFX_DATA.Entities.Relations
{
  public class UserLocation_Relation : BaseEntity
  {
    public long IdUser { get; set; }
    public long IdLocation { get; set; }

    public virtual User User { get; set; }
    public virtual Location Location { get; set; }
  }
}
