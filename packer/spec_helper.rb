# frozen_string_literal: true

require 'serverspec'
require 'net/ssh'

options = Net::SSH::Config.for(host, [])
options[:user] = ENV['TARGET_USER']
options[:keys] = ENV['TARGET_KEY']
options[:host_name] = ENV['TARGET_HOST']
options[:port] = ENV['TARGET_PORT']

unless ENV['SERVERSPEC_HOST_KEY_CHECKING'] =~ /^(true|t|yes|y|1)$/i
  options[:verify_host_key] = false
end

set :host,         options[:host_name]
set :ssh_options,  options
set :backend,      :ssh
set :disable_sudo, false
set :request_pty,  true

require "yaml"

def node
  return @node if @node

  @node = YAML.load_file("#{__dir__}/../node.yml")
end
