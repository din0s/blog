#!/bin/bash

# Abort on errors
set -e

# Build the Zola site
zola build

# Navigate to the public folder
cd public

# Initialize Git if it doesn't exist
if [ ! -d ".git" ]; then
  git init
  git remote add origin git@github.com:din0s/blog.git
fi

# Commit and push to gh-pages branch
git checkout -B gh-pages
git add .
git commit -m "Deploy $(date +'%Y-%m-%d %H:%M:%S')"
git push --force origin gh-pages

# Return to the project root
cd ..
