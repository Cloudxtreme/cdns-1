module CDNS
  module DNS
    class Zone

      def initialize(json)
        @attributes = MultiJson.load(json, symbolize_keys: true)
      end

      def nodes
        @nodes ||= @attributes[:nodes].map { |node| CDN::NodeGroup.load(node) }
      end

      def source
        @attributes[:source]
      end

      def source_type
        @attributes[:source_type]
      end

      def servers(country, state)
        nodes.each do |node|
          return node.addresses if node.match?(country, state)
        end

        [source_type, source]
      end
    end
  end
end
