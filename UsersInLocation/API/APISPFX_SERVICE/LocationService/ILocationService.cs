using APISPFX_MODEL.Models.LocationModel;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace APISPFX_SERVICE.LocationService
{
  public interface ILocationService
  {
    Task<IEnumerable<LocationModel>> Search(LocationModel model);

    Task<LocationModel> GetById(long idLocation);
    Task<LocationModel> Create(LocationModel model);

    Task<LocationModel> Update(LocationModel model);

    Task<bool> Delete(List<long> ids);
  }
}
