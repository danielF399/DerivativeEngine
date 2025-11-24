#!/usr/bin/env bash
set -e


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

VENV_DIR=".venv"

echo ">>> Setting up Python virtual environment in $VENV_DIR ..."


if [ ! -d "$VENV_DIR" ]; then
  python3 -m venv "$VENV_DIR"
  echo ">>> Virtualenv created."
else
  echo ">>> Virtualenv already exists. Skipping creation."
fi

source "$VENV_DIR/bin/activate"

echo ">>> Upgrading pip ..."
pip install --upgrade pip

if [ -f "requirements.txt" ]; then
  echo ">>> Installing Python dependencies from requirements.txt ..."
  pip install -r requirements.txt
else
  echo ">>> No requirements.txt found, skipping dependency installation."
fi

echo ">>> Environment setup complete."
echo ">>> To use it later, run: source .venv/bin/activate"