# pixel-art

Librería de sprites y animaciones pixel art en formato [pixelsrc](https://scbrown.github.io/pixelsrc/book/) (`.pxl`, JSONL texto) generadas con IA y versionadas en git.

Inspirada en la persona *AI Enthusiast* de la docu de pixelsrc.

## Estructura

- `src/pxl/sprites/` — sprites individuales
- `src/pxl/animations/` — animaciones autocontenidas (paleta + frames + animation en un solo archivo)
- `src/pxl/palettes/` — paletas compartidas; se referencian con `"palette": "@include:../palettes/<file>.pxl"` dentro del objeto sprite
- `prompts/` — plantillas de prompt guardadas (`pxl prompts <template>`: animation, character)
- `build/` — output de render, ignorado por git

## Instalación

Descargar el binario de [releases](https://github.com/scbrown/pixelsrc/releases) (macOS arm64: `pxl-v0.3.0-aarch64-apple-darwin.tar.gz`) y ponerlo en el `PATH`; o compilar desde el clone:

```
cargo install --path .
```

## Workflow

1. Pedir el sprite/animación a la IA (o escribirla).
2. `just validate` — valida cada `.pxl` con `pxl validate --strict`.
3. `just preview` — genera GIFs x8 en `build/preview/`.
4. Commitear solo `src/` y `prompts/`.

## Recetas just

| Receta | Qué hace |
|---|---|
| `just preview` | GIFs x8 en `build/preview/` |
| `just watch` | Re-render al cambiar archivos |
| `just render` | Render simple |
| `just gif <name>` | GIF de un archivo |
| `just sheet <name>` | Spritesheet de un archivo |
| `just validate` | Valida todos los `.pxl` |
| `just clean` | Borra `build/` |

## Uso con opencode

Subagentes en `.opencode/agents/`:

- `sprite` y `animator` (glm-5.3): generan `.pxl` y validan hasta que pasa.
- `pxl-review` (glm-5.3-flash): valida todo.

Comandos: `/sprite <descripción>`, `/anim <descripción>`, `/check`. Detalles en [AGENTS.md](AGENTS.md).

## Docs

https://scbrown.github.io/pixelsrc/book/
