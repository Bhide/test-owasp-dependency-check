#!/bin/bash

# Check if NVD_API_KEY is set
if [ -z "$NVD_API_KEY" ]; then
  echo "NVD_API_KEY is not set. Please set the NVD_API_KEY environment variable."
  exit 1
fi

# Path to Dependency-Check
DEPENDENCY_CHECK_PATH="dependency-check"

# Check if Dependency-Check is installed
if ! [ -x "$(command -v $DEPENDENCY_CHECK_PATH)" ]; then
  echo "Error: Dependency-Check is not installed." >&2
  exit 1
fi

# Path to the Podfile.lock
PODFILE_LOCK_PATH="Podfile.lock"

# Check if Podfile.lock exists
if [ ! -f "$PODFILE_LOCK_PATH" ]; then
  echo "Error: Podfile.lock file not found in the current directory." >&2
  exit 1
fi

# Output directory
OUTPUT_DIR="./dependency-check-report"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Run Dependency-Check
$DEPENDENCY_CHECK_PATH --project "OWASP Dependency Scan Pod" --scan "$PODFILE_LOCK_PATH" --format "HTML" --out "$OUTPUT_DIR" --nvdApiKey "$NVD_API_KEY"

# Check if Dependency-Check ran successfully
if [ $? -eq 0 ]; then
  echo "Dependency-Check completed successfully. Report generated in $OUTPUT_DIR."
else
  echo "Error: Dependency-Check failed." >&2
  exit 1
fi
