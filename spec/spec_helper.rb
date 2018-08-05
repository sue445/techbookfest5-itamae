# frozen_string_literal: true

# Disable sudo
# set :disable_sudo, true

# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'

require "yaml"

def node
  return @node if @node

  @node = YAML.load_file("#{__dir__}/../node.yml")
end
