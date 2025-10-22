#!/bin/bash
#
# This script uses PyInstaller to create a single, standalone executable
# from your Python/GTK4 script, removing the dependency on an installed
# Python environment.
#
# PREREQUISITE: You must have PyInstaller installed:
# pip install pyinstaller

# --- CONFIGURATION ---
PYTHON_SCRIPT="amo"
EXECUTABLE_NAME="amo"
OUTPUT_DIR="dist"

# --- EXECUTION ---

echo "Starting PyInstaller build for $PYTHON_SCRIPT..."

# Check if the Python script exists
if [ ! -f "$PYTHON_SCRIPT" ]; then
    echo "ERROR: Source file '$PYTHON_SCRIPT' not found. Please ensure your Python script is named this way."
    exit 1
fi

# 1. Run PyInstaller
# --onefile (-F): Creates a single executable file instead of a directory.
# --name: Sets the desired name of the executable.
# --clean: Cleans up temporary files from previous builds.
# --noconsole (-w): Suppresses the console window (important for GUI apps like GTK/LibAdwaita).
# --add-data: GTK4/LibAdwaita apps often need special hooks or data files. 
#             PyInstaller is usually smart enough, but complex apps may need this.


if [ $BUILD_STATUS -ne 0 ]; then
    echo ":: ERROR: PyInstaller failed to create the executable."
    exit 1
fi

# 2. Display success message
echo "================================================="
echo "✅ SUCCESS: Standalone Executable Created!"
echo "The executable is located here: $OUTPUT_DIR/$EXECUTABLE_NAME"
echo "================================================="

# The resulting executable will be in the 'dist' directory.