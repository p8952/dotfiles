class gtk {
  file { "${home_dir}/.config":
    ensure => directory,
  }

  file { "${home_dir}/.config/gtk-3.0":
    ensure  => directory,
    require => File["${home_dir}/.config"],
  }

  file { "${home_dir}/.config/gtk-3.0/settings.ini":
    ensure  => present,
    source  => 'puppet:///modules/gtk/gtk-3.0',
    require => File["${home_dir}/.config/gtk-3.0"],
  }

  file { "${home_dir}/.gtkrc-2.0":
    ensure => present,
    source => 'puppet:///modules/gtk/gtk-2.0',
  }

  exec { 'reload_gtk_theme':
    command     => '/usr/bin/python2 -c "import gtk; events=gtk.gdk.Event(gtk.gdk.CLIENT_EVENT); data=gtk.gdk.atom_intern(\"_GTK_READ_RCFILES\", False); events.data_format=8; events.send_event=True; events.message_type=data; events.send_clientmessage_toall();"',
    refreshonly => true,
  }
}
