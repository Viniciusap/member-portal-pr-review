# Secure coding standard (member website)

Approved by the AppSec team, 2019-04. Applies to every page and API that stores text typed by a user.

1. **Free text (names, notes, comments): SEC-12.** Encode it with `Server.HTMLEncode` (or `HttpUtility.HtmlEncode` in .NET) before saving it, so no markup is ever stored in the database.
2. **SQL:** always call stored procedures with typed parameters. Never build SQL by joining strings.
3. **Secrets:** never in code or config files; use the vault.
