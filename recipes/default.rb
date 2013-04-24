#
# Cookbook Name:: chefclient_simple_cron
# Recipe:: default
#
# Copyright 2013, HiganWorks LLC.
#

cron "chefclient_simple_cron" do
  action :create
  weekday '*'
  month '*'
  day '*'
  hour '*'
  minute node['chef_client_cron']['cron_minute']
  command [node['chef_client_cron']['bin'],node['chef_client_cron']['run_opton']].join(' ')
end
