module RSpec
  module Formatter
    begin
      require "rspec/core/version"
      if RSpec::Core::Version::STRING >= "3"
        require "rspec/formatter/git_auto_commit_rspec3"
        GitAutoCommit = GitAutoCommitRSpec3
      else
        require "rspec/formatter/git_auto_commit_rspec2"
        GitAutoCommit = GitAutoCommitRSpec2
      end
    end
  end
end
