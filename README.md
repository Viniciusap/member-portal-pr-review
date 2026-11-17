# Code review: pull request #418

You lead a small team of developers that fixes security problems in an old website where
customers manage their health savings accounts (Classic ASP pages, a .NET API, an Angular
front end, SQL Server). Luis, a developer on your team, used the team's AI coding agent to fix
security problem **MYT-2417** and opened pull request #418. He asks you to approve it today.

Nothing to install or run: read the code and write your answers in `REVIEW.md`.
You may use your AI tool; we will watch how you use it. You can do the tasks in any order.

## Files

- `FINDING.md`: the security problem, as the security tool reported it.
- `PR.md`: the pull request: description, Luis's comment and the changes.
- `web/`, `api/`, `client/`, `db/`, `jobs/`: the code **before** the PR.
- `docs/`: the team's secure coding standard.

## Tasks: 12 minutes in total

1. **Decide (about 4 minutes).** Would you merge it as it is, ask for changes, or reject it?
   The PR has **three** problems that should block it. Name as many as you can, in a sentence each.
2. **Map (about 3 minutes).** List every page, API, app, procedure or job that reads or
   depends on what this PR changes.
3. **Close (about 3 minutes).** Write what must be true before MYT-2417 counts as fixed:
   security, behavior that must keep working, and the evidence (scanner, pipeline, tests).
4. **Comment (about 2 minutes).** Write the review comment you would post to Luis.

If you are still on one task two minutes after its time, move to the next one.
At 12 minutes we stop and talk about your review.
