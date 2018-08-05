# frozen_string_literal: true

execute "rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm && yum clean all" do
  not_if "ls /etc/yum.repos.d/remi.repo"
end

package "redis" do
  options "--enablerepo=remi"
end

service "redis" do
  action [:start, :enable]
end
