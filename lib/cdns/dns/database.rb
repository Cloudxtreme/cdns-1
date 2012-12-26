module CDNS
  module DNS
    class Database
      def initialize(store)
        @store = store
      end
      attr_reader :store

      def zone(code)
        resource = store.hget("zones", code)
        return Zone.new(resource)
      end

      def soa(key = nil, value = nil)
        if key.nil? & value.nil?
          store.hgetall "settings.soa"
        elsif !key.nil? & value.nil?
          store.hget "settings.soa", key
        else
          store.hset "settings.soa", key, value
        end
      end
    end
  end
end
