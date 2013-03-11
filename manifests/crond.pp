define cron::crond(
  $command,
  $env = {},
  $user = 'root',
  $minute = '*',
  $hour = '*',
  $day_of_month = '*',
  $month = '*',
  $day_of_week = '*',
  $ensure = present
) {
  include cron
  file{"/etc/cron.d/$name.cron":
    content => template('cron/crond.erb'),
    notify => Service['crond'],
    ensure => $ensure,
    owner => root, group => root, mode => 0600;
  }
}
