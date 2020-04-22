using System;
using System.Collections.Generic;
using System.Text;

namespace APISPFX_MODEL.Models
{
  public class BaseModel
  {
    public virtual long Id { get; set; }
    public virtual bool IsActive { get; set; }
    public virtual bool IsDeleted { get; set; }
    public virtual DateTime CreatedOnUtc { get; set; }
    public virtual DateTime? UpdatedOnUtc { get; set; }

  }
}
