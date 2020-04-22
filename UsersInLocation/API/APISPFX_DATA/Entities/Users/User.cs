using APISPFX_DATA.Base;
using APISPFX_DATA.Entities.Relations;
using System.Collections.Generic;

namespace APISPFX_DATA.Entities.Users
{
  public class User : BaseEntity
  {
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Phone { get; set; }
  }
}
