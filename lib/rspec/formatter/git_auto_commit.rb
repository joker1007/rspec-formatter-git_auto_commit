require "rspec/core/formatters/base_text_formatter"

module RSpec
  module Formatter
    class GitAutoCommit < RSpec::Core::Formatters::BaseTextFormatter
      VERSION = "0.0.1"

      GIT_PROG = ENV["GIT_BIN"] || "git"

      def dump_summary(duration, example_count, failure_count, pending_count)
        state = failure_count == 0 ? "[green]" : "[red]"
        summary = summary_line(example_count, failure_count, pending_count)
        duration = "in #{format_duration(duration)}"
        commit_message = [state, summary, duration].join(" ")
        system("#{GIT_PROG} add -u")
        commit_message << "\n\n"
        commit_message << `#{GIT_PROG} diff --cached`
        commit_message << "\n\n"
        commit_message << "File Status:\n"
        commit_message << `#{GIT_PROG} status -s`

        File.popen("#{GIT_PROG} commit -F -", "r+") do |fd|
          fd.write commit_message
          fd.close
        end

        log = `#{GIT_PROG} log --oneline -n 1`
        output.puts "\nAuto committed.\n"
        output.puts colorise_summary(log)
      end
    end
  end
end
