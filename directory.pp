class directoriesscripts {

  # create a directory for scripts    
  file { '/home/monitor/scripts/':
    ensure => 'directory',

  }
