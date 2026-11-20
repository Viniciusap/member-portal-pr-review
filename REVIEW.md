# Review of pull request #418 (MYT-2417)

Write short answers. Plain words are fine.

## T1. Your decision and the blocking problems

Decision (merge as it is / ask for changes / reject): Ask for changes.

Problem 1: The XSS is not fixed. summary.asp still prints DisplayName unencoded (HTML line 9, JS string line 13), so the 37 stored rows still run, and HTMLEncode doesn't escape ' or \, so \';alert(1)// still runs on line 13. Encode at output, per context.

Problem 2: The CleanInput change is out of scope and corrupts data. SQL is already parameterized, so it just stores O''Brien in names, addresses (printed letters) and breaks support search. It can also push values past 100 chars and fail the save.

Problem 3: Encoding on save breaks non-HTML readers: Angular shows "Mary &amp; Joe", and the mailing export prints it ("Dear Mary &amp; Joe," is already in the October CSV). Next run is Dec 1, inside the freeze. "Nothing else reads it" is false.

Also: the test can't run (Server_HTMLEncode doesn't exist in cscript) and the SAST scan skipped summary.asp. SEC-12 (encode before saving) is the root cause and should be revised with AppSec.

## T2. What else reads or depends on the code or data this PR changes

- CleanInput (validation.inc): save_profile.asp, update_address.asp (-> addresses on letters), member_search.asp (support search), any other page that includes it.
- dbo.Members.DisplayName:
  - usp_GetMemberProfile -> db.inc -> summary.asp (members and support agents)
  - usp_GetMemberProfile -> MembersController (GET api/members/{id}/profile) -> Angular profile-card, mobile app
  - usp_StatementMailingExport -> "Statement mailing" job -> CSV -> print vendor -> letters
  - existing data: 37 rows with < or >, plus rows already encoded
- To confirm (not in repo): usp_SaveAddress, usp_SearchMembers, mobile app, pipeline, scanner.

## T3. Acceptance criteria to close MYT-2417

Security:
- Output encoding on summary.asp: HTMLEncode on line 9; line 13 stops writing the value into JS (data- attribute + textContent).
- No encoding on save.
- XSS payloads (incl. \';alert(1)//) and the 37 rows don't run, for members or support agents.
- Angular/mobile checked; security reviews the 37 rows for real attacks.

Behavior (what must keep working):
- CleanInput reverted.
- O'Brien, Mary & Joe, Ana <3 and accents display correctly on web, API, mobile and letters; search and addresses work.
- Already-encoded rows decoded once (backup + reviewed script); mailing CSV unchanged.

Evidence (scanner, pipeline, tests):
- Merged via the Azure DevOps pipeline.
- New client scan covering summary.asp, MYT-2417 gone; original PoC re-tested.
- Payload tests running in the pipeline; evidence attached to the ticket.

## T4. Your review comment to Luis (as you would post it on the PR)

Requesting changes. This doesn't close MYT-2417 and would break things during the freeze:

1. summary.asp still prints DisplayName raw (line 9, and in a JS string on line 13). The 37 existing rows still run, and \';alert(1)// gets past HTMLEncode. Fix it at output: HTMLEncode on line 9, and move line 13's value to a data- attribute read with textContent.
2. Revert CleanInput: SQL is already parameterized, so it just stores O''Brien.
3. Remove encode-on-save: the API and the Dec 1 mailing export would show "Mary &amp; Joe".

The test can't run under cscript and the scan skipped summary.asp. I need a pipeline run, a client scan of summary.asp and payload tests. It's a few lines; push today and I'll review right away.
