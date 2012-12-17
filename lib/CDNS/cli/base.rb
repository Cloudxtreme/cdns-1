
module CDNS
  module CLI
    class Base < ::Thor
      no_tasks do
        def store
          CDNS.store
        end
      end
    end
  end
end
