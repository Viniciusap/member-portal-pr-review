// ASP.NET Web API. Called by the member website (Angular) and by the mobile app.
[RoutePrefix("api/members")]
public class MembersController : ApiController
{
    private readonly IMemberRepository _repo;     // calls dbo.usp_GetMemberProfile
    private readonly IAccessPolicy _access;

    public MembersController(IMemberRepository repo, IAccessPolicy access)
    {
        _repo = repo;
        _access = access;
    }

    [HttpGet, Route("{memberId:int}/profile")]
    public IHttpActionResult GetProfile(int memberId)
    {
        if (!_access.CanView(User, memberId)) return StatusCode(HttpStatusCode.Forbidden);
        var p = _repo.GetMemberProfile(memberId);
        return Ok(new { p.MemberId, p.DisplayName, p.PlanName });
    }
}
