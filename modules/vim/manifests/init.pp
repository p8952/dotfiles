class vim {

	file { '/home/peter/.vimrc':
		ensure => present,
		source => 'puppet:///modules/vim/vimrc',
	}

	file { ['/home/peter/.vim',
			'/home/peter/.vim/autoload',
			'/home/peter/.vim/bundle',]:
		ensure => directory,
		before => File['/home/peter/.vim/autoload/pathogen.vim'],
	}

	file { '/home/peter/.vim/autoload/pathogen.vim':
		ensure => present,
		source => 'puppet:///modules/vim/pathogen.vim',
	}

	vcsrepo { '/home/peter/.vim/bundle/nerdtree':
		ensure => present,
		provider => git,
		source => 'https://github.com/scrooloose/nerdtree.git',
		revision => 'master',
	}

	vcsrepo { '/home/peter/.vim/bundle/supertab':
		ensure => present,
		provider => git,
		source => 'https://github.com/ervandew/supertab.git',
		revision => 'master',
	}

	vcsrepo { '/home/peter/.vim/bundle/tagbar':
		ensure => present,
		provider => git,
		source => 'https://github.com/majutsushi/tagbar.git',
		revision => 'master',
	}

	vcsrepo { '/home/peter/.vim/bundle/vim-colors-wombat':
		ensure => present,
		provider => git,
		source => 'https://github.com/p8952/vim-colors-wombat.git',
		revision => 'master',
	}

	vcsrepo { '/home/peter/.vim/bundle/vim-gitgutter':
		ensure => present,
		provider => git,
		source => 'https://github.com/airblade/vim-gitgutter.git',
		revision => 'master',
	}

}
