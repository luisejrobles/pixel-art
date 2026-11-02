# Pixelsrc animation project commands

default: preview

# Generate preview GIFs for all animations
preview:
    for f in src/pxl/animations/*.pxl; do pxl render "$f" --gif -o "build/preview/$(basename "$f" .pxl).gif" --scale 8; done

# Watch for changes and regenerate previews
watch:
    pxl build --watch

# Render all sprites at 2x scale
render:
    pxl render src/pxl/sprites/*.pxl --scale 2 -o build/

# Render specific animation as GIF
gif name:
    pxl render src/pxl/animations/{{name}}.pxl --gif -o build/preview/{{name}}.gif --scale 8

# Render animation as spritesheet
sheet name:
    pxl render src/pxl/animations/{{name}}.pxl --spritesheet -o build/{{name}}_sheet.png

# Validate all source files
validate:
    for f in src/pxl/animations/*.pxl src/pxl/palettes/*.pxl src/pxl/sprites/*.pxl; do if [ -f "$f" ]; then pxl validate "$f" --strict || exit 1; fi; done

# Clean build directory
clean:
    rm -rf build/*
