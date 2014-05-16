module RSpec
  module Formatter
    begin
      require "rspec/core/formatters/legacy_formatter"
      require "rspec/formatter/git_auto_commit_rspec3"
      GitAutoCommit = GitAutoCommitRSpec3
    rescue LoadError
      require "rspec/formatter/git_auto_commit_rspec2"
      GitAutoCommit = GitAutoCommitRSpec2
    end
  end
end
