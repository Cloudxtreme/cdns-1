# encoding: UTF-8

module CDNS::Cli
  class Global < Base
    include Thor::Actions
    namespace :global

    desc "ttl [VALUE]", "mostrar ou atualização o ttl global"
    def ttl(value = nil)
      if value.nil?
        say store.hget 'settings.global', 'ttl'
      else
        store.hset 'settings.global', 'ttl', value
        say "TTL global atualizado com sucesso"
      end
    end
  end
end

