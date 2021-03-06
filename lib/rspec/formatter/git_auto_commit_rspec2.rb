require "rspec/core/formatters/base_text_formatter"

module RSpec
  module Formatter
    class GitAutoCommitRSpec2 < RSpec::Core::Formatters::BaseTextFormatter
      GIT_PROG = ENV["GIT_BIN"] || "git"

      def message(message)
      end

      def dump_failures
      end

      def dump_pending
      end

      def seed(number)
      end

      def dump_summary(duration, example_count, failure_count, pending_count)
        state = failure_count == 0 ? "[green]" : "[red]"
        summary = summary_line(example_count, failure_count, pending_count)
        duration = "in #{format_duration(duration)}"
        commit_message = [state, summary, duration].join(" ")

        unless failed_examples.empty?
          commit_message << "\n\nFailed Examples:\n\n"
          failed_examples.each_with_index do |example, index|
            commit_message << "#{short_padding}#{index.next}) #{example.full_description}\n\n"
          end
        end

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
