# frozen_string_literal: true

package "memcached"

service "memcached" do
  action [:start, :enable]
end
