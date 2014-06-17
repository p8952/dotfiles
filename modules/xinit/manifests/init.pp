class xinit {

	file { '/home/peter/.xinitrc':
		ensure => present,
		source => 'puppet:///modules/xinit/xinitrc',
	}

	file { '/home/peter/.Xresources':
		ensure => present,
		source => 'puppet:///modules/xinit/Xresources',
	}

}
