#!/usr/bin/env bash

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed or not in PATH"
    exit 1
fi

# Run uv in docker container to generate builtins.txt
docker run --rm \
    -v "$(pwd)/lsl-definitions:/app/lsl-definitions" \
    -v "$(pwd):/app/output" \
    -w /app/lsl-definitions \
    ghcr.io/astral-sh/uv:debian \
    uv run --no-sync python gen_definitions.py lsl_definitions.yaml gen_builtins_txt /app/output/builtins.txt
