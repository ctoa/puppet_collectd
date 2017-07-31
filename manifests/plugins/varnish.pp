class collectd::plugins::varnish (
  $modules,
  $filter_metrics = false,
  $filter_metric_rules = {},
  $plugin_template = 'collectd/plugins/varnish/10-varnish.conf.erb',
  $package_name = 'collectd-varnish',
  $package_ensure = present,
  $package_required = ($::osfamily == 'RedHat')
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugins::plugin_common { 'varnish':
    package_name     => $package_name,
    package_ensure   => $package_ensure,
    package_required => $package_required,
    plugin_file_name => '10-varnish.conf',
    plugin_content   => template($plugin_template),
  }
}
