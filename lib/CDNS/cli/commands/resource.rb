# encoding: UTF-8

module CDNS::CLI
  class Resource < Base
    include Thor::Actions
    namespace :resource

    desc "list", "retorna todos os resource ids existentes"
    def list
      print_in_columns store.hkeys("resources")
    end

    desc "show [RESOURCE_ID]", "mostrar detalhes de um resources especifico"
    def show(resource)
      value = store.hget("resources", resource)
      
      if value.nil?
        say "Resource não encontrado"
      else
        print_table MultiJson.load(value)
      end
    end

    desc "add RESOURCE_ID SOURCE SOURCE_TYPE", "adiciona um novo resource"
    long_desc <<-END
      RESOURCE_ID: Identificador alphanumerico para o cliente \n
      SOURCE: IP/FQDN do servidor do cliente \n
      SOURCE_TYPE: A ou CNAME
    END
    option :nodes, type: :array, aliases: "-d", required: true, desc: "Exemplo: NA SA EU"
    def add(resource_id, source, source_type)
      data = {
        source: source,
        source_type: source_type,
        nodes: options[:nodes]
      }

      store.hset "resources", resource_id, MultiJson.dump(data)
      say "Resource criado/atualizado com sucesso"
    end
  end
end

