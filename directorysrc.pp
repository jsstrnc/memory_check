class directoriessrc {
	
   # create a directory for source
  file { '/home/monitor/src/':
    ensure => 'directory',
  }
  
  class symlinker {

  # preferred symlink syntax
  file { 'my_memory_check':
    ensure => 'link',
    target => '/home/monitor/src/my_memory_check',
  }
