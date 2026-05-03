default:
    @just --list

new project_name:
    mkdir -p {{project_name}}/{Resolve,Media}
    touch {{project_name}}/{outline,references,script,thoughts,todo}.md
    
    # init git with ignores
    cd {{project_name}} && git init
    echo "*.mp4\n*.webm\n*.mov\n*.exr\n*.png\nMedia/\nCanvas/node_modules/\nCanvas/dist/\nResolve/" > {{project_name}}/.gitignore
    
    echo 'add-canvas:\n\tmkdir -p Canvas\n\tcd Canvas && npm create @canvas-commons@latest . --yes\n\tgit add Canvas .gitignore\n\tgit commit -m "chore: scaffold Canvas Commons environment"\n\nadd-manim:\n\tmkdir -p Manim\n\tcd Manim && python -m venv .venv\n\tcd Manim && .venv/bin/pip install manim\n\techo "\n# Manim\nManim/.venv/\nManim/__pycache__/\nManim/media/" >> .gitignore\n\tgit add Manim .gitignore\n\tgit commit -m "chore: scaffold Manim environment"\n\nadd-blend:\n\tmkdir -p Blender\n\techo "\n# Blender\nBlender/*.blend1\nBlender/*.blend2" >> .gitignore\n\tgit add Blender .gitignore\n\tgit commit -m "chore: scaffold Blender environment"' > {{project_name}}/Justfile

    cd {{project_name}} && git add . && git commit -m "chore: initialize project"
    @echo "Ready. Run 'just add-canvas', 'just add-manim', or 'just add-blend' inside the directory when needed."
