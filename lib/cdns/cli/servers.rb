# encoding: utf-8

module CDNS::Cli
  class Server < Base
    namespace :server

    desc "list", "retorna uma lista com o nome e status dos servidores"
    def list
      print_in_columns %w[name status last_check]
    end
  end
end
