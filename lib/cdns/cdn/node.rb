module CDNS
  module CDN
    class Node

      def initialize
        @attributes = MultiJson.load(json, symbolize_keys: true)
      end

      def match?(country, state)
        country == self.country && state.include?(state)
      end

      def country
        @attributes[:country]        
      end

      def states
        @attributes[:states]
      end

      def servers
        @servers ||= @attributes[:servers].map { |server| Server.load(server) }
      end

      def addresses
        servers.map { |server| server.address }
      end

      def self.load(key, store = $redis)
        if $redis.hexists("nodes", key)
          self.new($redis.hget("nodes", key))
        else
          nil
        end
      end
    end
  end
end
