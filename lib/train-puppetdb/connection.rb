require 'puppetdb'
require 'train-puppetdb/platform'

module TrainPlugins
	module PuppetDBInterface
		class Connection < Train::Plugins::Transport::BaseConnection
			include TrainPlugins::PuppetDBInterface::Platform

			def initialize(options)
				if options.nil? || options[:server].nil?
					raise Train::TransportError, "You must set a PuppetDB server."
				end

				super(options)

				# Check if target is reachable
				begin
					@client = PuppetDB::Client.new({
						:server => options[:server],
						:pem => {
							'key' => options[:key],
							'cert' => options[:cert],
							'ca_file' => options[:cacert],
						}
					})

					@client.request('nodes', [:'~', 'certname', '.*'], {:limit => 1})
				rescue => e
					raise Train::TransportError, e.response
				end
			end

			def local?
				false
			end

			def uri
				'puppetdb://'
			end

			def puppetdb_client
				@client
			end
		end
	end
end
