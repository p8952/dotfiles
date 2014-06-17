class chromium {

	file { ["/home/$::id/.config", "/home/$::id/.config/chromium", "/home/$::id/.config/chromium/Default",]:
		ensure => directory,
		before => File["/home/$::id/.config/chromium/Default/Bookmarks"],
	}

	file { "/home/$::id/.config/chromium/Default/Bookmarks":
		ensure => present,
		source => 'puppet:///modules/chromium/Bookmarks',
	}

}
