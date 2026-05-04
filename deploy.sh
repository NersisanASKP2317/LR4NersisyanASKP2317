#!/bin/bash

# Скрипт развертывания Task Tracker на Django

echo "=========================================="
echo "TASK TRACKER - Nersisyan A.S."
echo "Django application deployment"
echo "=========================================="

# Check Python availability
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python3 is not installed"
    exit 1
fi

# Go to project root (where manage.py is)
cd /home/runner/workspace

# Check if manage.py exists
if [ ! -f "manage.py" ]; then
    echo "ERROR: manage.py not found in current directory"
    echo "Current directory: $(pwd)"
    echo "Make sure deploy.sh is in the same folder as manage.py"
    exit 1
fi

echo "Installing dependencies..."
pip install django > /dev/null 2>&1

echo "Starting Django server..."
python3 manage.py runserver 0.0.0.0:8000