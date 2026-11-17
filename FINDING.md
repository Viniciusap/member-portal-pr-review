# Security problem MYT-2417: stored cross-site scripting in the account holder's display name

**Source:** the client's security scanning tool, confirmed by the client's security team · **Type:** cross-site scripting (CWE-79) · **Severity:** High

**What happens:** an account holder (a customer with an account) can choose a display name on `web/profile/save_profile.asp`. The name is
saved to `dbo.Members.DisplayName` and shown on `web/account/summary.asp` without encoding. A
display name that contains a script runs in the browser of whoever opens that summary page:
the account holder, or a support agent who opens that person's account during a phone call.

**Confirmed:** a test display name containing a script ran on `summary.asp`.

**Data already stored:** 37 rows in `dbo.Members.DisplayName` already contain `<` or `>`.

**To close it:** the fix merged through the Azure DevOps pipeline, a new scan that no longer
reports the problem, and the evidence attached to the ticket.
