class vim {

	file { "/home/$::id/.vimrc":
		ensure => present,
		source => 'puppet:///modules/vim/vimrc',
	}

	file { ["/home/$::id/.vim", "/home/$::id/.vim/autoload", "/home/$::id/.vim/bundle",]:
		ensure => directory,
		before => File["/home/$::id/.vim/autoload/pathogen.vim"],
	}

	file { "/home/$::id/.vim/autoload/pathogen.vim":
		ensure => present,
		source => 'puppet:///modules/vim/pathogen.vim',
	}

	vcsrepo { "/home/$::id/.vim/bundle/nerdtree":
		ensure => present,
		provider => git,
		source => 'https://github.com/scrooloose/nerdtree.git',
		revision => 'master',
	}

	vcsrepo { "/home/$::id/.vim/bundle/supertab":
		ensure => present,
		provider => git,
		source => 'https://github.com/ervandew/supertab.git',
		revision => 'master',
	}

	vcsrepo { "/home/$::id/.vim/bundle/tagbar":
		ensure => present,
		provider => git,
		source => 'https://github.com/majutsushi/tagbar.git',
		revision => 'master',
	}

	vcsrepo { "/home/$::id/.vim/bundle/vim-colors-wombat":
		ensure => present,
		provider => git,
		source => 'https://github.com/p8952/vim-colors-wombat.git',
		revision => 'master',
	}

	vcsrepo { "/home/$::id/.vim/bundle/vim-gitgutter":
		ensure => present,
		provider => git,
		source => 'https://github.com/airblade/vim-gitgutter.git',
		revision => 'master',
	}

}
