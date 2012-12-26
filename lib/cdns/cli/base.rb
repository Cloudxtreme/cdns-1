module CDNS
  module Cli
    class Base < Thor
      include Thor::Actions

      protected
        def store
          CDNS.store
        end
    end
  end
end
