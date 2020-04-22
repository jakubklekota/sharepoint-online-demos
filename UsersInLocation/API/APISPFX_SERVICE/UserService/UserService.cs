using APISPFX_DATA.Entities.Users;
using APISPFX_DATA.UnitOfWork;
using APISPFX_MODEL.Models.RelationModel;
using APISPFX_MODEL.Models.UserModel;
using APISPFX_SERVICE.LocationService;
using APISPFX_SERVICE.RelationService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPFX_SERVICE.UserService
{

  public class UserService : IUserService
  {
    private readonly IUnitOfWork _userRepository;

    private readonly IUserLocationRelationService _userLocationRelationService;

    public UserService(IUnitOfWork userRepository,
      IUserLocationRelationService userLocationRelationService)
    {
      this._userRepository = userRepository;
      this._userLocationRelationService = userLocationRelationService;
    }
    
    public async Task<IEnumerable<UserModel>> Search(UserModel model)
    {
      try
      {
        var query = await this._userRepository.GetRepositoryAsync<User>().GetListAsync(null);

        if (!string.IsNullOrWhiteSpace(model.FirstName))
        {
          query = query.Where(a => a.FirstName.StartsWith(model.FirstName, StringComparison.OrdinalIgnoreCase)).ToList();
        }
        if (!string.IsNullOrWhiteSpace(model.LastName))
        {
          query = query.Where(a => a.FirstName.StartsWith(model.LastName, StringComparison.OrdinalIgnoreCase)).ToList();
        }
        if (!string.IsNullOrWhiteSpace(model.Phone))
        {
          query = query.Where(a => a.FirstName.StartsWith(model.Phone, StringComparison.OrdinalIgnoreCase)).ToList();
        }

        var result = query.Select(async a =>
        {
          var location = await _userLocationRelationService.GetRelationByIdUser(a.Id);

          var userModel = new UserModel()
          {
            Id = a.Id,
            FirstName = a.FirstName,
            LastName = a.LastName,
            Phone = a.Phone
          };

          if(location != null)
          {
            userModel.IdLocation = location.IdLocation;
            userModel.LocationName = location.LocationName;
          }

          return userModel;
        });

        return result.Select(a=>a.Result);
      }
      catch(Exception ex)
      {
        //TODO log exception
        throw ex;
      }
    }
    public async Task<UserModel> Create(UserModel model)
    {
      try
      {
        // TODO
        // CHANGE TO AUTOMAPPER
        var userEntity = new User()
        {
          FirstName = model.FirstName,
          LastName = model.LastName,
          Phone = model.Phone,
          IsActive = true,
          IsDeleted = false,
          CreatedOnUtc = DateTime.UtcNow
        };
        
        _userRepository.GetRepositoryAsync<User>().Add(userEntity);

        await _userRepository.SaveChangesAsync();

        model.Id = userEntity.Id;

        if (model.IdLocation > 0)
          await _userLocationRelationService.Create(
            new UserLocationRelationModel() {
              IdUser = userEntity.Id,
              IdLocation = model.IdLocation
            });

        return model;
      }
      catch(Exception ex)
      {
        //TODO log exception
        throw ex;
      }
    }

    public async Task<UserModel> Update(UserModel model)
    {
      try
      {
        var user = await _userRepository.GetRepositoryAsync<User>().GetAsync(a=>a.Id.Equals(model.Id), false);

        if (user != null)
        {

          user.FirstName = model.FirstName;
          user.LastName = model.LastName;
          user.Phone = model.Phone;

          user.UpdatedOnUtc = DateTime.UtcNow;

          await _userRepository.GetRepositoryAsync<User>().UpdateAsync(user);

          if (model.IdLocation > 0)
          {
            var userLocationRelationLocationModel = await _userLocationRelationService.GetRelationByIdUser(user.Id);

            if (userLocationRelationLocationModel != null)
            {

              userLocationRelationLocationModel.IdLocation = model.IdLocation;

              await _userLocationRelationService.Update(new UserLocationRelationModel()
              {
                IdUser = userLocationRelationLocationModel.IdUser,
                IdLocation = userLocationRelationLocationModel.IdLocation
              });
            }
          }
          
          return model;
        }

        throw new ArgumentNullException("Update faild. Location is null");

      }
      catch(Exception ex)
      {
        //TODO log exception
        throw ex;
      }
    }

    public async Task<bool> Delete(IList<long> ids)
    {
      try
      {
        foreach(var id in ids)
        {
          var user = await _userRepository.GetRepositoryAsync<User>().GetAsync(a => a.Id.Equals(id), false);

          user.IsActive = false;
          user.IsDeleted = true;
          user.UpdatedOnUtc = DateTime.UtcNow;

          await _userRepository.GetRepositoryAsync<User>().UpdateAsync(user);
        }

        return true;
      }
      catch (Exception ex)
      {
        //TODO log exception
        throw ex;
      }
    }
  }
}
