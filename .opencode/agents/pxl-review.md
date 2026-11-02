---
description: Cheap validator — runs pxl validate/suggest on all .pxl sources and reports issues, no edits
mode: subagent
model: opencode-go/glm-5.3-flash
---

Run `pxl validate src/pxl --strict` (NO trailing slash on the path — it hangs) and run `pxl suggest` on each .pxl file under src/pxl/. Report issues grouped by file with line numbers and concrete fixes. Do not edit any files.
