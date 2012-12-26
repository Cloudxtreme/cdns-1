require "geoip"

module CDNS
  class GeoIP
    GIP = ::GeoIP

    attr_reader :database

    def initialize(file)
      if File.exists?(file)
        @database = GIP::City.new(file, :memory)
      else
        raise "GeoIP Database not found."
      end
    end

    def match(ip)
      result = database.look_up(ip)

      return [result[:country_code], result[:region_name]] if result
      nil
    end
  end
end