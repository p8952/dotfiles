node default {
  case $id {
    'root':  { $home_dir = '/root' }
    default: { $home_dir = "/home/${::id}" }
  }

  $nodes   = hiera('nodes')
  $device  = $nodes["$::hostname"]
  $role    = $device['role']

  hiera_include('classes', [])
}
