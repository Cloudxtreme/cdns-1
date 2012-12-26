
module CDNS
  module Cli
    class Base < ::Thor
      protected
        def store
          CDNS.store
        end
    end
  end
end
