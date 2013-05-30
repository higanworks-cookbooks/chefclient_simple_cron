name             'chefclient_simple_cron'
maintainer       'HiganWorks LLC.'
maintainer_email 'sawanoboriyu@higanworks.com'
license          'apache2'
description      'just add chef-client to crontab, for smartos'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'
supports         'smartos','ubuntu'
depends          'logadm'
