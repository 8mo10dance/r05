git fetch --prune
git diff --name-only --diff-filter=d origin/${GITHUB_BASE_REF}...origin/${GITHUB_HEAD_REF} -- | xargs bundle exec rubocop --force-exclusion -P --fail-level E | tee .rubocop_result

rubocop_exit_status="${PIPESTATUS[1]}"

cat .rubocop_result | reviewdog -f=rubocop -reporter=github-pr-review

exit $rubocop_exit_status
