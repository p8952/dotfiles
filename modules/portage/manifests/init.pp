class portage {
  File {
    owner => 'root',
    group => 'root',
    mode  => 0644
  }

  $cpu_flags          = hiera('cpu_flags')
  $enabled_use_flags  = hiera('enabled_use_flags')
  $disabled_use_flags = hiera('disabled_use_flags')
  $video_cards        = hiera('video_cards')
  $input_devices      = hiera('input_devices')
  $packages           = hiera_array('packages')

  file { '/var/lib/portage/world':
    ensure  => present,
    owner   => 'root',
    group   => 'portage',
    content => join(sort($packages), "\n"),
  }

  file { '/etc/portage/make.conf':
    ensure  => present,
    content => template('portage/make.conf.erb')
  }

  file { '/etc/portage/package.use':
    ensure  => directory,
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/portage/package.use'
  }

  file { '/etc/portage/package.accept_keywords':
    ensure  => directory,
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/portage/package.accept_keywords'
  }

  file { '/etc/portage/repos.conf':
    ensure  => directory,
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/portage/repos.conf'
  }
}
