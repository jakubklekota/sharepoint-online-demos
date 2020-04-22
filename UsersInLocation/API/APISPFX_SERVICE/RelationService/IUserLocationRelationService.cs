using APISPFX_MODEL.Models.LocationModel;
using APISPFX_MODEL.Models.RelationModel;
using System.Threading.Tasks;

namespace APISPFX_SERVICE.RelationService
{
  public interface IUserLocationRelationService
  {
    Task<bool> Create(UserLocationRelationModel model);

    Task<bool> Update(UserLocationRelationModel model);

    Task<bool> Delete(UserLocationRelationModel model);

    Task<UserLocationRelationLocationModel> GetRelationByIdLocation(long idLocation);
    Task<UserLocationRelationUserModel> GetRelationByIdUser(long idUser);

  }
}
