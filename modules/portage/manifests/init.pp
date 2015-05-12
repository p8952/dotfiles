class portage {
  File {
    owner => 'root',
    group => 'root',
    mode  => 0644
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
    ensure  => directory
  }

  file { '/etc/portage/repos.conf/gentoo.conf':
    ensure  => file,
    source  => 'puppet:///modules/portage/gentoo.conf',
    require => File['/etc/portage/repos.conf']
  }

  file { '/etc/portage/repos.conf/yngwin.conf':
    ensure  => file,
    source  => 'puppet:///modules/portage/yngwin.conf',
    require => File['/etc/portage/repos.conf']
  }
}
