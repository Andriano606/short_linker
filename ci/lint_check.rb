#!/usr/bin/env ruby

# Right now we run the audits in all pipelines, we might want to move that to happen only on merges,
# so unrelated changes are not stopped by it.

def run(cmd)
  puts cmd
  system cmd
end

# We are skipping audit checks for now since we have moved to using Dependabot to nag us about
# security updates that we need to update. We keep the code in place in case we want to easily
# reenable it in the future.
skip_audit_checks = true #ENV['SKIP_AUDIT_CHECKS'] == 'true'

if skip_audit_checks
  puts 'WARNING, skipping audit checks since SKIP_AUDIT_CHECK is set'
else
  run "yarn audit"
  # The yarn audit command will exit with a non-0 exit code if there are issues of any severity found.
  # The exit code will be a mask of the severities.
  #
  # 1 for INFO
  # 2 for LOW
  # 4 for MODERATE
  # 8 for HIGH
  # 16 for CRITICAL
  # For example, if only INFO and MODERATE vulnerabilities were found, then the exit code will be 1 + 4 = 5
  if $?.exitstatus >= 16
    exit 1
  end

  exit 1 unless run 'bundle audit check --update'
end

exit 1 unless run <<~CMD
rubocop && \
i18n-tasks missing && \
i18n-tasks check-normalized && \
slim-lint app/**/*.slim && \
yarn prettier --list-different "{app,__{tests,mocks}__}/**/*.{js,ts,vue}"
CMD
