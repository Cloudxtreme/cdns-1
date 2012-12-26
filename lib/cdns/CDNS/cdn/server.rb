module CDNS
  module CDN
    class Server

      def initialize
        @attributes = MultiJson.load(json, symbolize_keys: true)
      end

      def match?(country, state)
        country == self.country && state.include?(state)
      end

      def addr
        @attributes[:addr]        
      end

      def active?
        @attributes[:active] && @attributes[:ping] <= Time.now.to_i
      end

      def servers
        @servers ||= @attributes[:servers].map { |server| Server.new(server) }
      end

      def address
        addr if active?
      end

      def self.load(key, store = $redis)
        if $redis.hexists("servers", key)
          self.new($redis.hget("servers", key))
        else
          nil
        end
      end
    end
  end
end