class xinit {
  file { "${home_dir}/.xinitrc":
    ensure => present,
    source => 'puppet:///modules/xinit/xinitrc',
  }

  file { "${home_dir}/.Xresources":
    ensure => present,
    source => 'puppet:///modules/xinit/Xresources',
  }
}
