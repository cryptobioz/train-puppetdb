libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'train-puppetdb/version'
require 'train-puppetdb/transport'
require 'train-puppetdb/platform'
require 'train-puppetdb/connection'
