class xinit {
  if $::id == 'root' {
    $home_dir = '/root'
  } else {
    $home_dir = "/home/${::id}"
  }

  file { "${home_dir}/.xinitrc":
    ensure => present,
    source => 'puppet:///modules/xinit/xinitrc',
  }

  file { "${home_dir}/.Xresources":
    ensure => present,
    source => 'puppet:///modules/xinit/Xresources',
  }
}
