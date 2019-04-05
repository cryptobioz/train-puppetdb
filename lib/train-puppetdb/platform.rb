module TrainPlugins::PuppetDBInterface
	module Platform
		def platform
			Train::Platforms.name('puppetdb')
			force_platform!('puppetdb', release: TrainPlugins::PuppetDBInterface::VERSION)
		end
	end
end
