using APISPFX_MODEL.Models.HomeModel;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace APISPFX_SERVICE.HomeService
{
  public interface IUserInLocationService
  {
    Task<IEnumerable<UserInLocationModel>> Search(UserInLocationModel model);

  }
}
