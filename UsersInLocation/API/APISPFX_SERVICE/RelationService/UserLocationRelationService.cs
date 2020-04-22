using APISPFX_DATA.Entities.Relations;
using APISPFX_DATA.UnitOfWork;
using APISPFX_MODEL.Models.RelationModel;
using System;
using System.Threading.Tasks;

namespace APISPFX_SERVICE.RelationService
{
  public class UserLocationRelationService : IUserLocationRelationService
  {
    private readonly IUnitOfWork _userLocationRelationRepository;

    public UserLocationRelationService(IUnitOfWork userLocationRelationRepository)
    {
      this._userLocationRelationRepository = userLocationRelationRepository;
    }

    public async Task<bool> Create(UserLocationRelationModel model)
    {
      try
      {
        this._userLocationRelationRepository.GetRepositoryAsync<UserLocation_Relation>()
         .Add(new UserLocation_Relation()
         {
           IdLocation = model.IdLocation,
           IdUser = model.IdUser,
           IsActive = true,
           IsDeleted = false,
           CreatedOnUtc = DateTime.UtcNow
         });

        var status = await _userLocationRelationRepository.SaveChangesAsync();

        return await Task.FromResult(true);
      }
      catch(Exception ex)
      {
        throw ex;
      }
    }

    public async Task<bool> Update(UserLocationRelationModel model)
    {
      try
      {
        var user = await _userLocationRelationRepository.GetRepositoryAsync<UserLocation_Relation>()
          .GetAsync(a => a.IdUser.Equals(model.IdUser));

        if (user != null)
        {
          if (user.IdLocation != model.IdLocation)
          {
            user.IdLocation = model.IdLocation;
            user.UpdatedOnUtc = DateTime.UtcNow;

            await _userLocationRelationRepository.GetRepositoryAsync<UserLocation_Relation>().UpdateAsync(user);

            return await Task.FromResult(true);
          }
        }

        throw new ArgumentNullException("Update faild. User is null");
      }
      catch (Exception ex)
      {
        throw ex;
      }
    }
    
    public async Task<bool> Delete(UserLocationRelationModel model)
    {
      try
      {
        var relation = await _userLocationRelationRepository.GetRepositoryAsync<UserLocation_Relation>()
          .GetAsync(a => a.IdUser.Equals(model.IdUser) && a.IdLocation.Equals(model.IdLocation));

        if (relation != null)
        {
          relation.IsActive = false;
          relation.IsDeleted = true;
          relation.UpdatedOnUtc = DateTime.UtcNow;

          await _userLocationRelationRepository.GetRepositoryAsync<UserLocation_Relation>().UpdateAsync(relation);

          return await Task.FromResult(true);
        }

        return await Task.FromResult(false);
      }
      catch (Exception ex)
      {
        throw ex;
      }
    }

    public async Task<UserLocationRelationLocationModel> GetRelationByIdLocation(long idLocation)
    {
      var relation = await _userLocationRelationRepository
        .GetRepositoryAsync<UserLocation_Relation>().GetAsync(a => a.IdLocation.Equals(idLocation), false, b => b.Location);

      if (relation != null)
      {
        return new UserLocationRelationLocationModel()
        {
          IdLocation = relation.IdLocation,
          IdUser = relation.IdUser,
          LocationName = relation.Location.Name
        };
      }

      return await Task.FromResult<UserLocationRelationLocationModel>(null);
    }

    public async Task<UserLocationRelationUserModel> GetRelationByIdUser(long idUser)
    {
      var relation = await _userLocationRelationRepository
        .GetRepositoryAsync<UserLocation_Relation>().GetAsync(a=>a.IdUser.Equals(idUser), false, b => b.Location, b=>b.User);

      if (relation != null)
      {
        return new UserLocationRelationUserModel()
        {
          IdLocation = relation.Location.Id,
          IdUser = relation.IdUser,
          FirstName = relation.User.FirstName,
          LastName = relation.User.LastName,
          Phone = relation.User.Phone,
          LocationName = relation.Location.Name
        };
      }

      return await Task.FromResult<UserLocationRelationUserModel>(null);
    }
  }
}
