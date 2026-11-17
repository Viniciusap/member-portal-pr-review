# Monthly mailing job

Runs at 02:00 on the 1st of each month (SQL Server Agent job "Statement mailing").
Calls `dbo.usp_StatementMailingExport` and sends the result as a CSV file to the print vendor,
who prints the letters exactly as received ("Dear <DisplayName>," and the address).

Last month's file (first rows): `jobs/samples/statement_letters_2026-10.csv`.
