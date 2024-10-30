lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'demo_lorem/version'

Gem::Specification.new do |spec|
  spec.name          = 'demo_lorem'
  spec.version       = DemoLorem::VERSION
  spec.authors       = ['Manmohan-menon']
  spec.email         = ['manmohan.menon@gmail.com']
  spec.description   = 'Lorem Ipsum generator'
  spec.summary       = 'A dummy text generator like lorem ipsum or some user specific topic'
  spec.homepage      = 'https://github.com/Manmohan-menon/demo_lorem'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Manmohan-menon/demo_lorem'
  spec.metadata['changelog_uri'] = 'https://github.com/Manmohan-menon/demo_lorem'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      'lib/**/*.rb',
      'lib/demo_lorem/helpers/*.rb',
      'README.md',
      'demo_lorem.gemspec'
    ].reject { |file| file == 'demo_lorem-0.0.4.gem' }
  end

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.test_files = Dir['spec/**/*_spec.rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_runtime_dependency 'cgi', '~> 0.1', '>= 0.1.0'
  spec.add_runtime_dependency 'httparty', '~> 0.18', '>= 0.18.1'
  spec.add_dependency 'json', '~> 2.6'
  spec.add_runtime_dependency 'openai', '~> 0.1', '>= 0.1.0'
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'webmock', '~> 3.18'
end
