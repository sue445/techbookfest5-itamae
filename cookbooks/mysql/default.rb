# frozen_string_literal: true

execute "rpm -ivh https://dev.mysql.com/get/mysql80-community-release-el6-1.noarch.rpm && yum clean all" do
  not_if "ls /etc/yum.repos.d/mysql-community.repo"
end

package "mysql-community-server"

service "mysqld" do
  action [:start, :enable]
end
