# AGENTS.md

## Project

pixelsrc (`.pxl` JSONL) pixel-art animation library. Source of truth for the format: https://scbrown.github.io/pixelsrc/book/

## Format rules

- Valid object types: `palette`, `sprite`, `animation`, `composition`, `variant`, `import`, `transform`, `particle`, `state-rules`. NO top-level `include` type (pxl 0.3.0 rejects it).
- Cross-file palettes: `"palette": "@include:../palettes/<file>.pxl"` inside the sprite object.
- Animations are SELF-CONTAINED: one file = shared palette line + all sprite frames + animation object last. `pxl render` reads a single file; cross-file frame references do not work.
- Use semantic color token names (`body`, `outline`, `shine`); `_` is transparent.
- One JSON object per line.
- Shapes: `rect [x,y,w,h]`, `points [[x,y],...]`, `union [...]`; coordinates must stay inside sprite bounds (`size [w,h]`).

## Workflow (mandatory)

1. After writing or editing any `.pxl` file, run `pxl validate <file> --strict < /dev/null` and fix until it prints "No issues found".
2. IMPORTANT: directory validation (`pxl validate src/pxl`) hangs — always validate per file.
3. Preview animations: `pxl render <file> --gif -o build/preview/<name>.gif --scale 8` (the `-o` needs a full file path; a directory path fails).
4. Never create or commit files under `build/`.

## v0.3.0 gotchas

- `pxl prompts <template>` takes the template positionally; there is no `show` subcommand. Templates: `character`, `item`, `tileset`, `animation`.
- `pxl render` accepts exactly one input file.
- `pxl build` reports 0 targets with this config — use the justfile loops (`just preview`, `just validate`) instead.

## Directories

- `src/pxl/sprites/` — single sprites
- `src/pxl/animations/` — self-contained animations
- `src/pxl/palettes/` — shared palettes
- `prompts/` — saved prompt templates

## OpenCode

Subagents: `sprite`, `animator` (model `opencode-go/glm-5.3`) and `pxl-review` (model `opencode-go/glm-5.3-flash`). Commands: `/sprite`, `/anim`, `/check`.
