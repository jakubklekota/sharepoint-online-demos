using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using APISPFX_DATA.Entities.Relations;
using APISPFX_DATA.UnitOfWork;
using APISPFX_MODEL.Models.HomeModel;

namespace APISPFX_SERVICE.HomeService
{
  public class UserInLocationService : IUserInLocationService
  {
    private readonly IUnitOfWork _userLocationRelationRepository;

    public UserInLocationService(IUnitOfWork userLocationRelationRepository)
    {
      _userLocationRelationRepository = userLocationRelationRepository;
    }

    public async Task<IEnumerable<UserInLocationModel>> Search(UserInLocationModel model)
    {
      var query = await _userLocationRelationRepository.GetRepositoryAsync<UserLocation_Relation>().GetListAsync(null, true, b => b.Location);

      var aggrateQuery = query.AsQueryable()
        .GroupBy(a => a.IdLocation).Select(b => new
        {
          Localizations = b.Select(a => a.Location.Name).Distinct(),
          UsersCount = b.Select(a => a.User).Count()

        }).ToList();


      return aggrateQuery.Select(a => new UserInLocationModel()
      {
        LocationName = a.Localizations.FirstOrDefault(),
        UserCount = a.UsersCount
      });
    }
  }
}
