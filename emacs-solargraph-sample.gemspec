$:.push File.expand_path('../lib', __FILE__)

require 'solargraph_sample/version.rb'

Gem::Specification.new do |spec|
  spec.name = 'solargraph-sample'
  spec.version = SolargraphSample::VERSION
  spec.authors = 'Danil Guskov'
  spec.email = 'gudkovd86@mail.ru'
  spec.description = 'Solargraph sample'
  spec.summary = spec.description
  spec.license = 'Apache 2'

  spec.files = `git ls-files`.split($/)
  spec.executables = []
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_dependency 'solargraph'
end
