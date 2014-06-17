class bash {

	file { "/home/$::id/.bashrc":
		ensure => present,
		source => 'puppet:///modules/bash/bashrc',
	}

	file { "/home/$::id/.bash_profile":
		ensure => present,
		source => 'puppet:///modules/bash/bash_profile',
	}

}
