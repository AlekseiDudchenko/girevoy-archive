# Git workflow — mandatory

- Never commit or push directly to `main` or `master`.
- Every change must be made on a separate branch and delivered through a Pull Request targeting `main`.
- This includes documentation, data fixes, generated files, CI/deployment changes, and trivial edits.
- Never use `noop`, `temp`, empty-file, or similar throwaway commits on `main` to force a deployment.
- To retry a deployment without a code change, use the deployment provider's retry/redeploy function instead of changing the repository.
- If the user asks to commit, fix, change, add, import, or update something without specifying Git workflow, use: branch → commit(s) → PR → review → merge.
- Treat `main` as protected even if GitHub repository settings still allow direct writes.
