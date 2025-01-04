#!/bin/bash
echo "Fetching from original repository (elizaOS/eliza)..."
git fetch upstream

echo "Fetching from intermediate fork (reinamora137/eliza)..."
git fetch intermediate

echo "Creating tracking branches..."
for branch in $(git branch -r | grep upstream | grep -v HEAD | sed 's/upstream\///'); do
    git branch --track $branch upstream/$branch 2>/dev/null || true
done

echo "Pushing to intermediate fork..."
git push intermediate --all

echo "Pushing to private repository..."
git push origin --all

echo "Synchronization complete."