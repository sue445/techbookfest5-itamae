package "nginx"

service "nginx" do
  action [:start, :enable]
end
