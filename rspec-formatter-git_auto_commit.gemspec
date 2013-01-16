# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["joker1007"]
  gem.email         = ["kakyoin.hierophant@gmail.com"]
  gem.description   = %q{RSpec git auto commit formatter}
  gem.summary       = %q{RSpec git auto commit formatter}
  gem.homepage      = "https://github.com/joker1007/rspec-formatter-git_auto_commit"

  gem.add_dependency('rspec', '~>2.11')
  gem.add_development_dependency('rake')

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rspec-formatter-git_auto_commit"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.5"
end
