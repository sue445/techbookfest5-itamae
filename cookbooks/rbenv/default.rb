# frozen_string_literal: true

include_recipe "rbenv::system"

template "/etc/profile.d/rbenv.sh" do
  variables(rbenv_root: node[:rbenv][:rbenv_root])
end
