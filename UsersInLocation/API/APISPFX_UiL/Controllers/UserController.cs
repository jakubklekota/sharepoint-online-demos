using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using APISPFX_MODEL.Models.UserModel;
using APISPFX_MODEL.Requests.UserRequest;
using APISPFX_MODEL.Responses.UserResponse;
using APISPFX_SERVICE.RelationService;
using APISPFX_SERVICE.UserService;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace APISPFX_UiL.Controllers
{
  [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
    private readonly IUserService _userService;

    private readonly IUserLocationRelationService _userLocationRelationService;

    public UserController(IUserService userService, IUserLocationRelationService userLocationRelationService)
    {
      _userService = userService;
      _userLocationRelationService = userLocationRelationService;
    }

    [Route("search-user")]
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

        var searchRequest = JsonConvert.DeserializeObject<UserSearchRequest.RootObject>(request);

        var query = await _userService.Search(new UserModel()
        {
          FirstName = searchRequest.UserSearch.FirstName,
          LastName = searchRequest.UserSearch.LastName,
          Phone = searchRequest.UserSearch.Phone
        });

        var model = query.Select(a => new UserSearchResponse.RootObject
        {
          UserSearch = new UserSearchResponse.UserSearch()
          {
            Id = a.Id,
            FirstName = a.FirstName,
            LastName = a.LastName,
            Phone = a.Phone,
            LocationName = a.LocationName
          }
        });

        return StatusCode(200, JsonConvert.SerializeObject(model));
      }
      catch(Exception ex)
      {
        return StatusCode(500, "Somthing went Wrong!");
      }
    }

    [Route("create-user")]
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

        var createRequest = JsonConvert.DeserializeObject<UserCreateRequest.RootObject>(request);

        var createModel = new UserModel()
        {
          FirstName = createRequest.UserCreate.FirstName,
          LastName = createRequest.UserCreate.LastName,
          Phone = createRequest.UserCreate.Phone,
          IdLocation = createRequest.UserCreate.IdLocation
        };
        
        var query = await _userService.Create(createModel);
        
        var model = new UserCreateResponse.RootObject
        {
          Created = true,
          UserCreate = new UserCreateResponse.UserCreate()
          {
            Id = query.Id,
            FirstName = query.FirstName,
            LastName = query.LastName,
            Phone = query.Phone,
            IdLocation = query.IdLocation
          }
        };

        return StatusCode(200, JsonConvert.SerializeObject(model));
      }
      catch(Exception ex)
      {
        var data = JsonConvert.SerializeObject(
          new UserCreateResponse.RootObject {
          Created = false,
          ErrorMsg = ex.Message
        });

        return StatusCode(500, JsonConvert.SerializeObject(data));
      }
    }

    [Route("update-user")]
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

        var updateRequest = JsonConvert.DeserializeObject<UserUpdateRequest.RootObject>(request);

        var query = await _userService.Update(new UserModel()
        {
          Id = updateRequest.UserUpdate.Id,
          FirstName = updateRequest.UserUpdate.FirstName,
          LastName = updateRequest.UserUpdate.LastName,
          Phone = updateRequest.UserUpdate.Phone,
          IdLocation = updateRequest.UserUpdate.IdLocation
        });
        
        var model = new UserUpdateResponse.RootObject
        {
          Updated = true,
          UserUpdate = new UserUpdateResponse.UserUpdate()
          {
            FirstName = query.FirstName,
            LastName = query.LastName,
            Phone = query.Phone,
            IdLocation =  query.IdLocation
          }
        };

        return StatusCode(200, JsonConvert.SerializeObject(model));
      }
      catch(Exception ex)
      {
        var data = JsonConvert.SerializeObject(
          new UserUpdateResponse.RootObject
          {
            Updated = false,
            ErrorMsg = ex.Message
          });

        return StatusCode(500, JsonConvert.SerializeObject(data));
      }
    }

    [Route("delete-user")]
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

        var deleteRequest = JsonConvert.DeserializeObject<UserDeleteRequest.RootObject>(request);

        var ids = deleteRequest.UserDelete.Select(a => a.Id).ToList();

        await _userService.Delete(ids);

        var model = new UserDeleteResponse.RootObject
        {
          Deleted = true,
          UserDelete = ids.Select(a =>
            new UserDeleteResponse.UserDelete()
            {
              Id = a
            }).ToList()
        };

        return StatusCode(200, JsonConvert.SerializeObject(model));

      }
      catch (Exception ex)
      {
        var data = JsonConvert.SerializeObject(
          new UserDeleteResponse.RootObject
          {
            Deleted = false,
            ErrorMsg = ex.Message
          });

        return StatusCode(500, JsonConvert.SerializeObject(data));
      }
    }
  }
}
