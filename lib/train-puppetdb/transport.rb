require 'train-puppetdb/connection'

module TrainPlugins
	module PuppetDBInterface
		class Transport < Train.plugin(1)
			name 'puppetdb'

			option :server, required: true, default: ENV['PUPPETDB_SERVER']
			option :key, default: ENV['PUPPETDB_KEY']
			option :cert, default: ENV['PUPPETDB_CERT']
			option :cacert, default: ENV['PUPPETDB_CACERT']

			def connection(_instance_opts = nil)
				@connection ||= TrainPlugins::PuppetDBInterface::Connection.new(@options)
			end
		end
	end
end
