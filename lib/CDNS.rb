require "rubygems"
require "bundler/setup"

require "cdns/version"
require "yaml"

module CDNS
  autoload :GeoIP,        'cdns/geoip'

  module DNS
    autoload :Database,   'cdns/dns/database'
    autoload :Zone,       'cdns/dns/zone'
  end
end
