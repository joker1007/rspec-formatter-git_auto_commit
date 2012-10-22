# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rspec/formatter/git_auto_commit', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["joker1007"]
  gem.email         = ["kakyoin.hierophant@gmail.com"]
  gem.description   = %q{RSpec git auto commit formatter}
  gem.summary       = %q{RSpec git auto commit formatter}
  gem.homepage      = ""

  gem.add_dependency('rspec', '~>2.11.0')
  gem.add_development_dependency('rake')

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rspec-formatter-git_auto_commit"
  gem.require_paths = ["lib"]
  gem.version       = RSpec::Formatter::GitAutoCommit::VERSION
end
