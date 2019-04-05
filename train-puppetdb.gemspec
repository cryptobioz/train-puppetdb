lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'train-puppetdb/version'

Gem::Specification.new do |spec|
	spec.name = 'train-puppetdb'
	spec.version = TrainPlugins::PuppetDBInterface::VERSION
	spec.authors = ['Léo Depriester']
	spec.email = ['leo.depriester@camptocamp.com']
	spec.summary = "PuppetDB plugin for Inspec's Backend"
	spec.license = 'Apache-2.0'
	spec.files = %w{
		train-puppetdb.gemspec Gemfile
	} + Dir.glob(
		'lib/**/*', File::FNM_DOTMATCH
	).reject { |f| File.directory?(f) }
	spec.require_paths = ['lib']

	spec.add_dependency 'puppetdb-ruby', '~> 1.1'
end
