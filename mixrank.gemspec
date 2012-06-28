# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mixrank/version', __FILE__)


Gem::Specification.new do |gem|
  gem.authors       = ["Ben Densmore"]
  gem.email         = ["bdensmore@gmail.com"]
  gem.description   = %q{Mixrank API}
  gem.summary       = %q{Allows users to make calls to Mixrank API}
  gem.homepage      = ""
  gem.add_dependency "builder"
  gem.add_dependency "httparty"
  gem.add_development_dependency "rake"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "mixrank"
  gem.require_paths = ["lib"]
  gem.version       = Mixrank::VERSION
end
