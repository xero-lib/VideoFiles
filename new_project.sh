#!/usr/bin/env bash
set -euo pipefail

if [ -z "${1:-}" ]; then
    echo "FATAL: No project name provided."
    echo "Usage: new_project.sh <project_name>"
    exit 1
fi

PROJECT_NAME=$1
PROJECT_PATH="$(pwd)/$PROJECT_NAME"

if [ -d "$PROJECT_PATH" ]; then
    echo "FATAL: Directory '$PROJECT_NAME' already exists. Aborting to prevent overwrite."
    exit 1
fi

echo "Initializing project directory: $PROJECT_NAME..."

mkdir "$PROJECT_PATH"
touch "$PROJECT_PATH"/{outline,references,script,thoughts,todo}.md
