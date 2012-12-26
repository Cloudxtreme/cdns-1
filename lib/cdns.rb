require "bundler/setup"

require "cdns/version"
require "yaml"
require "multi_json"

module CDNS
  autoload :GeoIP,        'cdns/geoip'

  module DNS
    autoload :Database,   'cdns/dns/database'
    autoload :Zone,       'cdns/dns/zone'
  end

  module CDN
    autoload :NodeGroup,  'cdns/cdn/node_group'
    autoload :Node,       'cdns/cdn/node'
    autoload :Server,     'cdns/cdn/server'
  end

  module Cli
    autoload :Runner,     'cdns/cli'
  end

  def self.store
    @redis ||= Redis.new
  end
end
