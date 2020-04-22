using System;
using System.Linq;
using System.Threading.Tasks;
using APISPFX_MODEL.Responses.HomeResponse;
using APISPFX_SERVICE.HomeService;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace APISPFX_UiL.Controllers
{
  [Authorize]
  [Route("api/[controller]")]
  [ApiController]
  public class HomeController : ControllerBase
  {
    private readonly IUserInLocationService _userInLocationService;

    public HomeController(IUserInLocationService userInLocationService)
    {
      _userInLocationService = userInLocationService;
    }

    [Route("stat-user-location")]
    [HttpPost]
    public async Task<IActionResult> UsersInLocationCount()
    {
      try
      {
        var query = await _userInLocationService.Search(null);

        var model = query.Select(a => new UserInLocationResponse.RootObject()
        {
          Success = true,
           UserInLocation = new UserInLocationResponse.UserInLocation()
           {
             LocationName = a.LocationName,
             UserCount = a.UserCount
           }
        });

        var data = JsonConvert.SerializeObject(model);

        return StatusCode(200, JsonConvert.SerializeObject(model));
      }
      catch (Exception ex)
      {
        return StatusCode(500, "Somthing went Wrong!");
      }
    }

  }
}
