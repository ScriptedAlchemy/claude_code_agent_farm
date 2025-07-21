#!/bin/bash

# Python development scripts for claude-code-agent-farm
# Provides equivalent functionality to the missing bun scripts

set -e

case "$1" in
    "type-check")
        echo "Running type checking with mypy..."
        python -m mypy claude_code_agent_farm.py
        echo "✅ Type checking passed!"
        ;;
    "lint")
        echo "Running linting with ruff..."
        python -m ruff check claude_code_agent_farm.py
        echo "✅ Linting passed!"
        ;;
    "format")
        echo "Formatting code with ruff..."
        python -m ruff format claude_code_agent_farm.py
        echo "✅ Code formatted!"
        ;;
    "check-all")
        echo "Running all checks..."
        echo "🔍 Type checking..."
        python -m mypy claude_code_agent_farm.py
        echo "🔍 Linting..."
        python -m ruff check claude_code_agent_farm.py
        echo "✅ All checks passed!"
        ;;
    *)
        echo "Usage: $0 {type-check|lint|format|check-all}"
        echo ""
        echo "Available commands:"
        echo "  type-check  - Run mypy type checking"
        echo "  lint        - Run ruff linting"
        echo "  format      - Format code with ruff"
        echo "  check-all   - Run all checks"
        echo ""
        echo "Example: bash scripts.sh type-check"
        exit 1
        ;;
esac