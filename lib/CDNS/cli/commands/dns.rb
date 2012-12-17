# encoding: UTF-8

module CDNS::CLI
  class DNS < Base
    include Thor::Actions
    namespace :dns

    desc "domains", "exibe os dominios aceitos pelo DNS Server"
    option :add, desc: "Adiciona um dominio"
    option :rm, desc: "Remove um dominio"
    def domains
      print_in_columns store.smembers 'settings.domains' if options.empty?

      if options[:add]
        store.sadd 'settings.domains', options[:add]
        say "Dominio #{options[:add]} adicionando com sucesso"
      end

      if options[:rm]
        store.srem 'settings.domains', options[:rm]
        say "Dominio #{options[:rm]} removido com sucesso"
      end
    end
  end
end

