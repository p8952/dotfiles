class xinit {
    if $::id == 'root' {
    $home_dir = '/root'
  } else {
    $home_dir = "/home/${::id}"
  }

  file { "/home/${::id}/.xinitrc":
    ensure => present,
    source => 'puppet:///modules/xinit/xinitrc',
  }

  file { "/home/${::id}/.Xresources":
    ensure => present,
    source => 'puppet:///modules/xinit/Xresources',
  }
}
