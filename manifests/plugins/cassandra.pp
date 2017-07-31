class collectd::plugins::cassandra (
  $modules,
  $plugin_template = 'collectd/plugins/cassandra/20-cassandra.conf.erb',
  $package_name = 'UNSET',
  $package_ensure = present,
  $package_required = false
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd
  include collectd::plugins::java

  collectd::plugins::plugin_common { 'cassandra':
    package_name     => $package_name,
    package_ensure   => $package_ensure,
    package_required => $package_required,
    plugin_file_name => '20-cassandra.conf',
    plugin_content   => template($plugin_template),
  }
}
