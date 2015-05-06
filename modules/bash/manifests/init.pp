class bash {
  file { "${home_dir}/.bashrc":
    ensure => present,
    source => 'puppet:///modules/bash/bashrc',
  }

  file { "${home_dir}/.bash_profile":
    ensure => present,
    source => 'puppet:///modules/bash/bash_profile',
  }
}
