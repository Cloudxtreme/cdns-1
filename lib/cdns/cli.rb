# encoding: UTF-8
require 'thor'
require 'thor/group'

require 'cdns/cli/base'
Dir[File.join(File.dirname(__FILE__), 'cli/commands/*')].each { |f| require f }

module CDNS
  module Cli
    class Runner < Thor #:nodoc

      register CDNS::Cli::SOA, :soa, 'soa [COMMAND]', 'Ver ou atualiza informações SOA DNS'
      register CDNS::Cli::Global, :global, 'global [COMMAND]', 'configuração de variaveis globais (ttl, fallback, etc)'
      register CDNS::Cli::DNS, :dns, 'dns [COMMAND]', 'configuração referente aos servidores DNS'
      register CDNS::Cli::Resource, :resource, 'resource [COMMAND]', 'gerenciamentos de clientes'
      register CDNS::Cli::Server, :server, 'server [COMMAND]', 'gerenciamento de servidores'
    end

  end
end


