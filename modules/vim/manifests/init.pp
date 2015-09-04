class vim {
  file { "${home_dir}/.vimrc":
    ensure => present,
    source => 'puppet:///modules/vim/vimrc',
  }

  file { "${home_dir}/.nvimrc":
    ensure => link,
    target => "${home_dir}/.vimrc",
  }

  file { [
    "${home_dir}/.vim",
    "${home_dir}/.vim/bundle",
  ]:
    ensure => directory,
    before => Vcsrepo["${home_dir}/.vim/bundle/vundle.vim"],
  }

  file { "${home_dir}/.nvim":
    ensure => link,
    target => "${home_dir}/.vim",
  }

  vcsrepo { "${home_dir}/.vim/bundle/vundle.vim":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/vundlevim/vundle.vim.git',
    revision => 'master',
  }
}
