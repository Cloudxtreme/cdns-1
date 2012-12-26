# encoding: UTF-8
require 'thor/group'

module CDNS
  module Cli
    class Base < Thor #:nodoc
      include Thor::Actions

      protected
      def store
        CDNS.store
      end
    end

    class Runner < Thor #:nodoc
      Dir[File.join(File.dirname(__FILE__), 'cli/*')].each { |f| require f }

      register CDNS::Cli::SOA, :soa, 'soa [COMMAND]', 'Ver ou atualiza informações SOA DNS'
      register CDNS::Cli::Global, :global, 'global [COMMAND]', 'configuração de variaveis globais (ttl, fallback, etc)'
      register CDNS::Cli::DNS, :dns, 'dns [COMMAND]', 'configuração referente aos servidores DNS'
      register CDNS::Cli::Resource, :resource, 'resource [COMMAND]', 'gerenciamentos de clientes'
      register CDNS::Cli::Server, :server, 'server [COMMAND]', 'gerenciamento de servidores'
    end

  end
end


