-- Used by web/includes/db.inc (Classic ASP pages) and by the .NET API (MembersController).
CREATE PROCEDURE dbo.usp_GetMemberProfile
    @MemberId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT m.MemberId, m.DisplayName, p.PlanName
    FROM dbo.Members m
    JOIN dbo.Plans p ON p.PlanId = m.PlanId
    WHERE m.MemberId = @MemberId;
END
