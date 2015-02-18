class xinit {
	file { "/home/$::id/.xinitrc":
		ensure => present,
		source => 'puppet:///modules/xinit/xinitrc',
	}

	file { "/home/$::id/.Xresources":
		ensure => present,
		source => 'puppet:///modules/xinit/Xresources',
	}
}
