# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rspec-git-commit-formatter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["joker1007"]
  gem.email         = ["kakyoin.hierophant@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.add_dependency('rspec', '~>2.11.0')
  gem.add_development_dependency('rake')

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rspec-git-commit-formatter"
  gem.require_paths = ["lib"]
  gem.version       = Rspec::Git::Commit::Formatter::VERSION
end
