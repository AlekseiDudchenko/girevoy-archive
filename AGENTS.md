# Repository agent rules

## Git workflow — mandatory

- **Never commit or push directly to `main` (or `master`).**
- Every repository change must be made on a separate branch and delivered through a GitHub Pull Request targeting `main`.
- This applies to all changes, including documentation, data fixes, generated files, CI/deployment changes, and tiny one-line edits.
- Do not create `noop`, `temp`, empty-file, or other throwaway commits on `main` to trigger a deployment.
- If a deployment must be retried without a code change, use the deployment provider's retry/redeploy mechanism instead of modifying `main`.
- When a user asks to “commit”, “fix”, “change”, “add”, or similar without explicitly specifying a Git workflow, interpret it as: **branch → commit(s) → PR → merge after review/approval**.
- Do not bypass this rule just because direct writes to the default branch are technically permitted by GitHub.

The default branch is `main`. Treat it as protected even if repository settings do not enforce branch protection yet.
