# frozen_string_literal: true

package "nginx"

service "nginx" do
  action [:start, :enable]
end
