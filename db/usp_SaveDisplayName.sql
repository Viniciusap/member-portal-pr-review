CREATE PROCEDURE dbo.usp_SaveDisplayName
    @MemberId INT,
    @DisplayName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.Members SET DisplayName = @DisplayName WHERE MemberId = @MemberId;
END
