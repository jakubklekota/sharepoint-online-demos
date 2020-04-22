using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using APISPFX_MODEL.Models.LocationModel;
using APISPFX_MODEL.Requests.LocationRequest;
using APISPFX_MODEL.Responses.LocationResponse;
using APISPFX_SERVICE.LocationService;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace APISPFX_UiL.Controllers
{
  [Authorize]
  [Route("api/[controller]")]
  [ApiController]
  public class LocationController : ControllerBase
  {
    private readonly ILocationService _locationService;

    public LocationController(ILocationService locationService)
    {
      _locationService = locationService;
    }

    [Route("search-location")]
    [HttpPost]
    public async Task<IActionResult> Search()
    {
      try
      {
        var request = string.Empty;

        var response = string.Empty;

        using (var reader = new StreamReader(Request.Body, Encoding.UTF8))
        {
          request = await reader.ReadToEndAsync();
        }

        if (string.IsNullOrWhiteSpace(request))
        {
          return StatusCode(204, "No Content");
        }

        var searchRequest = JsonConvert.DeserializeObject<LocationSearchRequest.RootObject>(request);

        var query = await _locationService.Search(new LocationModel()
        {
          Name = searchRequest.LocationSearch.Name
        });

        var model = query.Select(a => new LocationSearchResponse.RootObject
        {
          LocationSearch = new LocationSearchResponse.LocationSearch()
          {
            Id = a.Id,
            Name = a.Name
          }
        });

        return StatusCode(200, JsonConvert.SerializeObject(model));
      }
      catch (Exception ex)
      {
        return StatusCode(500, "Somthing went Wrong!");
      }
    }

    [Route("create-location")]
    [HttpPost]
    public async Task<IActionResult> Create()
    {
      try
      {
        var request = string.Empty;

        using (var reader = new StreamReader(Request.Body, Encoding.UTF8))
        {
          request = await reader.ReadToEndAsync();
        }

        if (string.IsNullOrWhiteSpace(request))
        {
          return StatusCode(204, "No Content");
        }

        var createRequest = JsonConvert.DeserializeObject<LocationCreateRequest.RootObject>(request);

        var createModel = new LocationModel()
        {
          Name = createRequest.LocationCreate.Name
        };

        var query = await _locationService.Create(createModel);

        var model = new LocationCreateResponse.RootObject
        {
          Created = true,
          LocationCreate = new LocationCreateResponse.LocationCreate()
          {
            Id = query.Id,
            Name = query.Name
          }
        };

        return StatusCode(200, JsonConvert.SerializeObject(model));
      }
      catch (Exception ex)
      {
        var data = JsonConvert.SerializeObject(
          new LocationCreateResponse.RootObject
          {
            Created = true,
            ErrorMsg = ex.Message
          });

        return StatusCode(500, JsonConvert.SerializeObject(data));
      }
    }

    [Route("update-location")]
    [HttpPut]
    public async Task<IActionResult> Update()
    {
      try
      {
        var request = string.Empty;

        using (var reader = new StreamReader(Request.Body, Encoding.UTF8))
        {
          request = await reader.ReadToEndAsync();
        }

        if (string.IsNullOrWhiteSpace(request))
        {
          return StatusCode(204, "No Content");
        }

        var updateRequest = JsonConvert.DeserializeObject<LocationUpdateRequest.RootObject>(request);

        var query = await _locationService.Update(new LocationModel()
        {
          Id = updateRequest.LocationUpdate.Id,
          Name = updateRequest.LocationUpdate.Name
        });

        var model = new LocationUpdateResponse.RootObject
        {
          Updated = true,
          LocationUpdate = new LocationUpdateResponse.LocationUpdate()
          {
            Id = query.Id,
            Name = query.Name
          }
        };

        return StatusCode(200, JsonConvert.SerializeObject(model));
      }
      catch (Exception ex)
      {
        var data = JsonConvert.SerializeObject(
          new LocationUpdateResponse.RootObject
          {
            Updated = true,
            ErrorMsg = ex.Message
          });

        return StatusCode(500, JsonConvert.SerializeObject(data));
      }
    }

    [Route("delete-location")]
    [HttpDelete]
    public async Task<IActionResult> Delete()
    {
      try
      {
        var request = string.Empty;

        using (var reader = new StreamReader(Request.Body, Encoding.UTF8))
        {
          request = await reader.ReadToEndAsync();
        }

        if (string.IsNullOrWhiteSpace(request))
        {
          return StatusCode(204, "No Content");
        }

        var deleteRequest = JsonConvert.DeserializeObject<LocationDeleteRequest.RootObject>(request);

        var ids = deleteRequest.LocationDelete.Select(a => a.Id).ToList();

        await _locationService.Delete(ids);

        var model = new LocationDeleteResponse.RootObject
        {
          Deleted = true,
          LocationDelete = ids.Select(a=>
            new LocationDeleteResponse.LocationDelete() {
              Id = a
            }).ToList()
        };

        return StatusCode(200, JsonConvert.SerializeObject(model));

      }
      catch (Exception ex)
      {
        var data = JsonConvert.SerializeObject(
          new LocationDeleteResponse.RootObject
          {
            Deleted = false,
            ErrorMsg = ex.Message
          });

        return StatusCode(500, JsonConvert.SerializeObject(data));
      }
    }
  }
}
