#!/usr/bin/env bash
# Automatically bumps the Service Worker cache version

set -e

SW_FILE="sw.js"

if [ ! -f "$SW_FILE" ]; then
  echo "Error: $SW_FILE not found!"
  exit 1
fi

# Extract current version number
current_version=$(grep -oP "CACHE_NAME = 'licod-v\K\d+" "$SW_FILE")

if [ -z "$current_version" ]; then
  echo "Error: Could not find cache version in $SW_FILE"
  exit 1
fi

# Increment version
new_version=$((current_version + 1))

# Update the file
sed -i "s/CACHE_NAME = 'licod-v${current_version}'/CACHE_NAME = 'licod-v${new_version}'/" "$SW_FILE"

echo "✅ Cache version bumped: v${current_version} → v${new_version}"
echo "Updated: $SW_FILE"
