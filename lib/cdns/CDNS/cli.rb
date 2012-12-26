# encoding: UTF-8
require 'thor/group'

require 'cdns/cli/base'
require 'cdns/cli/soa'
require 'cdns/cli/global'
require 'cdns/cli/dns'
require 'cdns/cli/resource'

module CDNS
  module Cli
    class Runner < Thor #:nodoc
      register CDNS::Cli::SOA, :soa, 'soa [COMMAND]', 'Ver ou atualiza informações SOA DNS'
      register CDNS::Cli::Global, :global, 'global [COMMAND]', 'configuração de variaveis globais (ttl, fallback, etc)'
      register CDNS::Cli::DNS, :dns, 'dns [COMMAND]', 'configuração referente aos servidores DNS'
      register CDNS::Cli::Resource, :resource, 'resource [COMMAND]', 'gerencia o resource'
    end
  end
end
