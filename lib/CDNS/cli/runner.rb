# encoding: UTF-8
require 'thor'
require 'thor/group'

require 'cdns/cli/base'
require 'cdns/cli/commands/soa'
require 'cdns/cli/commands/global'
require 'cdns/cli/commands/dns'
require 'cdns/cli/commands/resource'

module CDNS
  module CLI
    class Runner < Thor
      register CDNS::CLI::SOA, :soa, 'soa [COMMAND]', 'Ver ou atualiza informações SOA DNS'
      register CDNS::CLI::Global, :global, 'global [COMMAND]', 'configuração de variaveis globais (ttl, fallback, etc)'
      register CDNS::CLI::DNS, :dns, 'dns [COMMAND]', 'configuração referente aos servidores DNS'
      register CDNS::CLI::Resource, :resource, 'resource [COMMAND]', 'gerencia o resource'
    end
  end
end

