-- Run by the monthly mailing job (jobs/monthly_mailing.md). Its output is the file
-- the print vendor uses to print and mail the statement letters.
CREATE PROCEDURE dbo.usp_StatementMailingExport
    @StatementMonth DATE
AS
BEGIN
    SET NOCOUNT ON;
    SELECT m.MemberId,
           'Dear ' + m.DisplayName + ',' AS Salutation,
           a.Street, a.City,
           s.StatementId
    FROM dbo.Members m
    JOIN dbo.Addresses a ON a.MemberId = m.MemberId
    JOIN dbo.Statements s ON s.MemberId = m.MemberId AND s.StatementMonth = @StatementMonth;
END
