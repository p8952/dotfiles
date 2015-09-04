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
    before => Vcsrepo["${home_dir}/.vim/bundle/Vundle.vim"],
  }

  file { "${home_dir}/.nvim":
    ensure => link,
    target => "${home_dir}/.vim",
  }

  vcsrepo { "${home_dir}/.vim/bundle/Vundle.vim":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/VundleVim/Vundle.vim.git',
    revision => 'master',
  }
}
