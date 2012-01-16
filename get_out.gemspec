# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "get_out/version"

Gem::Specification.new do |s|
  s.name        = "get_out"
  s.version     = GetOut::VERSION
  s.authors     = ["Josef Šimánek"]
  s.email       = ["retro@ballgag.cz"]
  s.homepage    = "https://github.com/simi/get_out"
  s.summary     = %q{Simple get_out IRC bot}
  s.description = %q{GET OUT, NOW!}

  s.rubyforge_project = "get_out"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "cinch"
end
