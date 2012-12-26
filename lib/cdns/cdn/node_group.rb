module CDNS
  module CDN
    module NodeGroup

      def initialize(json)
        @attributes = MultiJson.load(json, symbolize_keys: true)
      end

      def run(country, state)
        return false unless countries.include?(country)

        address = nodes.map do |node|
          node.addresses if node.match?(country, state)
        end

        return false if address.nil?
        address.flatten
      end

      def countries
        @attributes[:countries]
      end

      def nodes
        @nodes ||= @attributes[:nodes].map { |node| Node.load(node) }
      end

      def self.load(key, store = $redis)
        if $redis.hexists("node_group", key)
          self.new($redis.hget("node_group", key))
        else
          nil
        end
      end
    end
  end
end
