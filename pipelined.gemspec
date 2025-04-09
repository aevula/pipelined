# frozen_string_literal: true

require_relative 'lib/pipelined/version'

Gem::Specification.new do |spec|
  spec.name = 'pipelined'
  spec.version = Pipelined::VERSION

  spec.summary = 'Gem for building pipelined code flow'
  spec.description = 'Minimalistic gem for building pipeline architectured services'

  spec.authors = ['@aevula']
  spec.homepage = 'https://github.com/aevula/pipelined'
  spec.license = 'MIT'

  spec.required_ruby_version = '>= 3.0'

  spec.metadata = {
    'homepage_uri'          => 'https://github.com/aevula/pipelined',
    'source_code_uri'       => 'https://github.com/aevula/pipelined/tree/master',
    'changelog_uri'         => 'https://github.com/aevula/pipelined/tree/master/CHANGELOG.md',
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir['README.md', 'LICENSE.txt', 'CHANGELOG.md', 'lib/**/*', 'Rakefile']

  spec.require_paths = ['lib']
end
