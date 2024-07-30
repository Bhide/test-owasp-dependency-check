#!/bin/bash

# Path to Dependency-Check
DEPENDENCY_CHECK_PATH="dependency-check"

# Path to the Podfile.lock
PODFILE_LOCK_PATH="./Podfile.lock"

# Output directory
OUTPUT_DIR="~/Documents/dependency-check-report"

# NVD API Key
NVD_API_KEY="a34cc15f-97f7-47bf-b9bb-c270237db6de"

# Run Dependency-Check
$DEPENDENCY_CHECK_PATH --project "Idee App" --scan "$PODFILE_LOCK_PATH" --format "HTML" --out "$OUTPUT_DIR" --nvdApiKey "$NVD_API_KEY"
