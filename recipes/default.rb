#
# Cookbook Name:: chefclient_simple_cron
# Recipe:: default
#
# Copyright 2013, HiganWorks LLC.
#

directory '/var/log/chef' do
  action :create
end

cron "chefclient_simple_cron" do
  action :create
  weekday '*'
  month '*'
  day '*'
  hour '*'
  minute node['chef_client_cron']['cron_minute']
  command [node['chef_client_cron']['bin'],node['chef_client_cron']['run_opton']].join(' ')
end

case node[:platform]
when 'smartos'
  logadm "chef-client" do
    path "/var/log/chef/client.log"
    copy true
    size "1b"
    period "7d"
    action :create
  end

else
  cookbook_file '/etc/logrotate.d/chef-client' do
    source 'logrotate_chef-client'
    action :create
  end

end
