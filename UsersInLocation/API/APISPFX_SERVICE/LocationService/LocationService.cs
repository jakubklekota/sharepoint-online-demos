using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using APISPFX_DATA.Entities.Locations;
using APISPFX_DATA.UnitOfWork;
using APISPFX_MODEL.Models.LocationModel;

namespace APISPFX_SERVICE.LocationService
{
  public class LocationService : ILocationService
  {
    private readonly IUnitOfWork _locationRepository;

    public LocationService(IUnitOfWork userRepository)
    {
      this._locationRepository = userRepository;
    }

    public async Task<IEnumerable<LocationModel>> Search(LocationModel model)
    {
      try
      {
        var query = await _locationRepository.GetRepositoryAsync<Location>().GetListAsync(null);

        if (!string.IsNullOrWhiteSpace(model.Name))
        {
          query = query.Where(a => a.Name.StartsWith(model.Name, StringComparison.OrdinalIgnoreCase)).ToList();
        }

        return query.Select(a => new LocationModel()
        {
          Id = a.Id,
          Name = a.Name
        });
      }
      catch(Exception ex)
      {
        //TODO log exception
        throw ex;
      }
    }

    public async Task<LocationModel> GetById(long idLocation)
    {
      try
      {
        var query = await _locationRepository.GetRepositoryAsync<Location>().GetAsync(a => a.Id.Equals(idLocation));
        
        return new LocationModel()
        {
          Name = query.Name
        };
      }
      catch (Exception ex)
      {
        //TODO log exception
        throw ex;
      }
    }

    public async Task<LocationModel> Create(LocationModel model)
    {
      try
      {
        var locationEntity = new Location()
        {
          Name = model.Name,
          IsActive = true,
          IsDeleted = false,
          CreatedOnUtc = DateTime.UtcNow
        };

        _locationRepository.GetRepositoryAsync<Location>().Add(locationEntity);

        await _locationRepository.SaveChangesAsync();

        model.Id = locationEntity.Id;

        return model;
      }
      catch (Exception ex)
      {
        //TODO log exception
        throw ex;
      }
    }

    public async Task<LocationModel> Update(LocationModel model)
    {
      try
      {
        var location = await _locationRepository.GetRepositoryAsync<Location>().GetAsync(a => a.Id.Equals(model.Id), false);

        if(location != null)
        {
          location.Name = model.Name;
          location.UpdatedOnUtc = DateTime.UtcNow;

          await _locationRepository.GetRepositoryAsync<Location>().UpdateAsync(location);

          return model;
        }

        throw new ArgumentNullException("Update faild. Location is null");
        
      }
      catch (Exception ex)
      {
        //TODO log exception
        throw ex;
      }
    }

    public async Task<bool> Delete(List<long> ids)
    {
      try
      {
        foreach (var id in ids)
        {
          var location = await _locationRepository.GetRepositoryAsync<Location>().GetAsync(a => a.Id.Equals(id), false);

          location.IsActive = false;
          location.IsDeleted = true;
          location.UpdatedOnUtc = DateTime.UtcNow;

          await _locationRepository.GetRepositoryAsync<Location>().UpdateAsync(location);
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
