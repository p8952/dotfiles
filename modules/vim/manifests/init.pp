class vim {
	if $::id == 'root' {
		$home_dir = '/root'
	} else {
		$home_dir = "/home/$::id"
	}

	file { "$home_dir/.vimrc":
		ensure => present,
		source => 'puppet:///modules/vim/vimrc',
	}

	file { ["$home_dir/.vim", "$home_dir/.vim/autoload", "$home_dir/.vim/bundle",]:
		ensure => directory,
		before => File["$home_dir/.vim/autoload/pathogen.vim"],
	}

	file { "$home_dir/.vim/autoload/pathogen.vim":
		ensure => present,
		source => 'puppet:///modules/vim/pathogen.vim',
	}

	vcsrepo { "$home_dir/.vim/bundle/ctrlp.vim":
		ensure => present,
		provider => git,
		source => 'https://github.com/kien/ctrlp.vim',
		revision => 'master',
	}

	vcsrepo { "$home_dir/.vim/bundle/nerdtree":
		ensure => present,
		provider => git,
		source => 'https://github.com/scrooloose/nerdtree.git',
		revision => 'master',
	}

	vcsrepo { "$home_dir/.vim/bundle/supertab":
		ensure => present,
		provider => git,
		source => 'https://github.com/ervandew/supertab.git',
		revision => 'master',
	}

	vcsrepo { "$home_dir/.vim/bundle/syntastic":
		ensure => present,
		provider => git,
		source => 'https://github.com/scrooloose/syntastic.git',
		revision => 'master',
	}

	vcsrepo { "$home_dir/.vim/bundle/tagbar":
		ensure => present,
		provider => git,
		source => 'https://github.com/majutsushi/tagbar.git',
		revision => 'master',
	}

	vcsrepo { "$home_dir/.vim/bundle/vim-airline":
		ensure => present,
		provider => git,
		source => 'https://github.com/bling/vim-airline.git',
		revision => 'master',
	}

	vcsrepo { "$home_dir/.vim/bundle/vim-colors-wombat":
		ensure => present,
		provider => git,
		source => 'https://github.com/p8952/vim-colors-wombat.git',
		revision => 'master',
	}

	vcsrepo { "$home_dir/.vim/bundle/vim-gitgutter":
		ensure => present,
		provider => git,
		source => 'https://github.com/airblade/vim-gitgutter.git',
		revision => 'master',
	}

}
