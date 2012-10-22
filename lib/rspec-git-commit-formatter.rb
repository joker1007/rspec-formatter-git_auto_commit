require "rspec-git-commit-formatter/version"
require "rspec/core/formatters/base_text_formatter"

class RspecGitCommitFormatter < RSpec::Core::Formatters::BaseTextFormatter
  GIT_PROG = ENV["GIT_BIN"] || "git"

  def dump_summary(duration, example_count, failure_count, pending_count)
    state = failure_count == 0 ? "red" : "green"
    summary = "examples: #{example_count}, failed: #{failure_count}, pending: #{pending_count}"
    commit_message = [state, summary].join(" ")
    system("#{GIT} add -u")
    commit_message << "\n\n"
    commit_message << `#{GIT} diff --cached`
    commit_message << "\n\n"
    commit_message << "File Status:\n"
    commit_message << `#{GIT} status -s`

    File.popen("git commit -F -", "r+") do |fd|
      fd.write commit_message
      fd.close
    end
  end
end
