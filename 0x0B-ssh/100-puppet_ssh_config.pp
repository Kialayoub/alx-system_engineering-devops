# config file


include stdlib

file_line { 'Turn off passwd auth':
  
  path   => '/etc/ssh/ssh_config',
  ensure => present,
  line   => '    PasswordAuthentication no',
  replace => true,
}

file_line { 'Delare identity file':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  replace => true,
  line   => '     IdentityFile ~/.ssh/school',
  
}
