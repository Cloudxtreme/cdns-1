# encoding: utf-8

module CDNS::Cli
  class Server < Base
    namespace :server

    desc "list", "retorna uma lista com o nome e status dos servidores"
    def list
      table = [%w[NAME IP STATUS LAST_CHECK]]
      server = store.hgetall "servers"

      table += server.map do |k, v| 
        v = MultiJson.load(v)
        [k, v["addr"], (v["active"] ? "online" : "offline"), (v["ping"].nil? ? "Nunca" : Time.at(v["ping"]))]
      end

      print_table table 
    end

    desc "add SERVER_ID ADDR", "adiciona um novo servidor"
    def add(server_id, addr)
      data = {
        addr: addr,
        status: false,
        ping: nil
      }

      store.hset "servers", server_id, MultiJson.dump(data)
      say "Servidor criado/atualizado com sucesso"
    end
  end
end
