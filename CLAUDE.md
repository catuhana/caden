# CLAUDE.md

> [!IMPORTANT]
> **Do only what I ask and nothing more**. Do not add any extra code, comments, or anything
> else that I didn't explicitly request. Do not be proactive, do not anticipate my needs,
> and do not make any assumptions.

## Environment

Development happens inside a Nix flake development shell, loaded automatically via `direnv`.

- To format code, run `nix fmt`. Flake has `treefmt-nix` set-up to format all code in the repository.

## Committing

Before committing, unless the change is trivial, ALWAYS run and ensure these pass:

1. `nix flake check`
2. `nix fmt`

In every commit you make, instead of using `Co-Authored-By`, you MUST use a convention similar to
the [kernel convention](https://docs.kernel.org/process/coding-assistants.html#attribution):

```text
Assisted-by: AGENT_NAME:MODEL_VERSION
```

- Replace `AGENT_NAME` with the used AI tool or framework, e.g. "Claude Code", "opencode".
- Replace `MODEL_VERSION` with the actual model in use, e.g. `claude-opus-4.8`, `deepseek-v4-flash`, `gemini-3.5-flash`.
