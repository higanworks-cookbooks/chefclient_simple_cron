default['chef_client_cron']['interval'] = 30
default['chef_client_cron']['base_minute'] = node['ipaddress'].split('.')[3].to_i % node['chef_client_cron']['interval'] % node['chef_client_cron']['interval']

# create basetime and interval
cron_str = node['chef_client_cron']['base_minute'].to_s
(60 / node['chef_client_cron']['interval']).times do |x|
  unless x == 0
    cron_str = cron_str + "," + (node['chef_client_cron']['base_minute'] + node['chef_client_cron']['interval'] * x).to_s
  end
end

default['chef_client_cron']['cron_minute'] = cron_str

## chef-client configuration
case node[:platform]
when 'smartos'
  default['chef_client_cron']['bin'] = '/opt/local/bin/chef-client'
else
  default['chef_client_cron']['bin'] = '/usr/bin/chef-client'
end

default['chef_client_cron']['run_opton'] = '-s 60 -l warn -L /var/log/chef/client.log  >/dev/null 2>&1'

