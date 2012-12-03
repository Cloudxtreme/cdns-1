require "rubygems"
require "bundler/setup"

require "cdns/version"
require "yaml"

module CDNS
  autoload :GeoIP,   'cdns/geoip'
end
