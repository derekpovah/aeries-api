
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aeries-api/version'

Gem::Specification.new do |spec|
  spec.name          = 'aeries-api'
  spec.version       = AeriesApi::VERSION
  spec.authors       = ['Derek Povah']
  spec.email         = ['derek@derekpovah.com']

  spec.summary       = %q{A simple REST client for the Aeries SIS API}
  spec.homepage      = 'https://github.com/derekpovah/aeries-api'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = spec.homepage
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', "~> 10.0"
  spec.add_development_dependency 'rspec', "~> 3.0"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'sinatra'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'activesupport'
  spec.add_dependency 'hashie'
  spec.add_dependency 'httparty'
end
