#!/bin/bash

# Check if commit message is provided
if [ -z "$1" ]; then
  echo "❌ Error: Please provide a commit message"
  echo "Usage: ./push.sh \"your commit message\""
  exit 1
fi

# Commit message
MSG="$1"

# Add all changes
git add .

# Commit
git commit -m "$MSG"

# Push to current branch
git push

echo "✅ Pushed successfully!"