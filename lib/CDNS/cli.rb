# encoding: UTF-8
require 'thor'
require 'redis'

module CDNS
  class CLI < Thor
    include Thor::Actions

    class SOA

    desc "soa:update", "registra/atualiza as informações SOA"
    method_option :noc
    method_option :refresh, type: :numeric, default: 86400, lazy_default: true
    method_option :retry, type: :numeric, default: 7200, lazy_default: true
    method_option :expire, type: :numeric, default: 3600000, lazy_default: true
    method_option :minimum, type: :numeric, default: 86400, lazy_default: true
    def :update
      options.each do |key, value|
        store.hset "settings.soa", key, value
      end
    end

    desc "soa:show", "exibe a configuração atual"
    def soa_show
      print_table store.hgetall("settings.soa")
    end

    no_tasks do
      def store
        @store ||= ::Redis.new
      end
    end
  end
end

CDNS::CLI.start
