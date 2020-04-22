using APISPFX_MODEL.Models.UserModel;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace APISPFX_SERVICE.UserService
{
  public interface IUserService
  {
    Task<IEnumerable<UserModel>> Search(UserModel model);

    Task<UserModel> Create(UserModel model);

    Task<UserModel> Update(UserModel model);

    Task<bool> Delete(IList<long> ids);
  }
}
