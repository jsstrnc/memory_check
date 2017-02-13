class directoriesscripts {

  # create a directory for scripts    
  file { '/home/monitor/scripts/':
    ensure => 'directory',
  }
  
  exec{'memory_check':
  command => "/usr/bin/wget -q https://raw.githubusercontent.com/jsstrnc/memory_check/readme-edits/README.md",
  creates => "/home/monitor/scripts/memory_check",
}


