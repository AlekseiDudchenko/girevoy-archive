# Repository agent rules

## Project roadmap — mandatory

- `docs/roadmap.md` is the **single source of truth for project plans, backlog, priorities, and implementation status**.
- Before starting any repository task, read the relevant parts of `docs/roadmap.md` so the work is consistent with current priorities and already-completed items.
- Do not create a parallel backlog in `AGENTS.md`, `CLAUDE.md`, GitHub Issues, PR descriptions, or other files.
- New product ideas, technical tasks, and priority changes must be reflected in `docs/roadmap.md`.
- If a change completes, supersedes, or materially changes a roadmap item, update `docs/roadmap.md` in the same PR so it stays in sync.

## Incremental commits — mandatory

- Commit and push as often as the work allows, so another agent can pick the task up from the
  branch without repeating anything.
- For long imports, commit **per category or per small group of pages**, not once at the end.
  A commit that covers half a protocol is a commit that cannot be handed over.
- Prefer many small commits over one large one even when the work is unfinished: a branch with
  20 categories done is useful, a working copy with 20 categories done is not.
- Leave the working tree clean at the end of every session, and push the branch. Uncommitted
  work is invisible to everyone else.
- State in the commit message what is done and what is not, so the next agent knows where the
  boundary is (for example: "страницы 1-7 из 33").

## Git workflow — mandatory

- **Never commit or push directly to `main` (or `master`).**
- Every repository change must be made on a separate branch and delivered through a GitHub Pull Request targeting `main`.
- This applies to all changes, including documentation, data fixes, generated files, CI/deployment changes, and tiny one-line edits.
- Do not create `noop`, `temp`, empty-file, or other throwaway commits on `main` to trigger a deployment.
- If a deployment must be retried without a code change, use the deployment provider's retry/redeploy mechanism instead of modifying `main`.
- When a user asks to “commit”, “fix”, “change”, “add”, or similar without explicitly specifying a Git workflow, interpret it as: **branch → commit(s) → PR → merge after review/approval**.
- Do not bypass this rule just because direct writes to the default branch are technically permitted by GitHub.

The default branch is `main`. Treat it as protected even if repository settings do not enforce branch protection yet.
