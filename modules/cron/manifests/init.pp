class cron {
  resources { 'cron':
    purge => true,
  }

  $cronjobs = hiera_array('cronjobs')

  define cronjob() {
    $sha1       = sha1($name)
    $split_name = split($name, ' ')
    $minute     = $split_name[0]
    $hour       = $split_name[1]
    $monthday   = $split_name[2]
    $month      = $split_name[3]
    $weekday    = $split_name[4]
    $command    = join(delete_at(delete_at(delete_at(delete_at(delete_at($split_name, 0), 0), 0), 0), 0), ' ')

    cron { $sha1:
      environment => 'MAILTO=""',
      minute   => $minute,
      hour     => $hour,
      monthday => $monthday,
      month    => $month,
      weekday  => $weekday,
      command  => $command,
    }
  }

  if $id == 'root' {
    cronjob { $cronjobs: }
  }
}
