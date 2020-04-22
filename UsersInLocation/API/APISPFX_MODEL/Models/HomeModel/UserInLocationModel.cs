using System;
using System.Collections.Generic;
using System.Text;

namespace APISPFX_MODEL.Models.HomeModel
{
  public class UserInLocationModel : BaseModel
  {
    public virtual string LocationName { get; set; }
    public virtual int UserCount { get; set; }
  }
}
