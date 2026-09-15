# AGENTS.md

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
Assisted-by: LLM_MODEL
```

- Replace `LLM_MODEL` with the actual model in use, e.g. `Gemini 3.8 Flash`, `Muse Spark 1.3`, `Claude Opus 5`.
