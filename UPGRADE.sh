git checkout HEAD public/build/assets/*;
git checkout HEAD public/build/*;
git checkout HEAD public/*;
git checkout HEAD package-lock.json;
git stash;
git fetch;
git rebase origin/v5-develop;
git stash pop;
