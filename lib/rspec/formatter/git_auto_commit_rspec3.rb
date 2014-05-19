require "rspec/core/formatters/base_text_formatter"

module RSpec
  module Formatter
    class GitAutoCommitRSpec3 < RSpec::Core::Formatters::BaseTextFormatter
      RSpec::Core::Formatters.register self, :dump_summary

      GIT_PROG = ENV["GIT_BIN"] || "git"

      def message(message)
      end

      def dump_failures(notification)
      end

      def dump_pending(notification)
      end

      def seed(notification)
      end

      def dump_summary(summary)
        state = summary.failure_count == 0 ? "[green]" : "[red]"
        duration = "in #{summary.formatted_duration}"
        commit_message = [state, summary.totals_line, duration].join(" ")

        unless summary.failed_examples.empty?
          commit_message << "\n\nFailed Examples:\n\n"
          summary.failed_examples.each_with_index do |example, index|
            commit_message << "  #{index.next}) #{example.full_description}\n\n"
          end
        end

        system("#{GIT_PROG} add -u")
        commit_message << "\n\n"
        commit_message << "File Diff:\n"
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

        colorizer = ::RSpec::Core::Formatters::ConsoleCodes
        if summary.failure_count > 0
          color_config = RSpec.configuration.failure_color
        elsif summary.pending_count > 0
          color_config = RSpec.configuration.pending_color
        else
          color_config = RSpec.configuration.success_color
        end
        output.puts colorizer.wrap(log, color_config)
      end
    end
  end
end
