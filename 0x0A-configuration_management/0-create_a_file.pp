# Using Puppet, create a file in /tmp

$doc_path = '/tmp/school'

file { $doc_path:
  ensure  => 'file',
  path    => $doc_path,
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet'
}
