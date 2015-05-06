node default {
  case $::id {
    'root':  { $home_dir = '/root' }
    default: { $home_dir = "/home/${::id}" }
  }

  case $::hardwareisa {
    'Intel(R) Core(TM)2 Duo CPU P8600 @ 2.40GHz': {
      $role = 'pc'
      $cpu_flags = 'mmx mmxext sse sse2 sse3 sse4_1 ssse3'
      $video_cards = 'intel'
    }
    'Intel(R) Core(TM) i7-4710HQ CPU @ 2.50GHz': {
      $role = 'pc'
      $cpu_flags = 'aes avx avx2 fma3 mmx mmxext popcnt sse sse2 sse3 sse4_1 sse4_2 ssse3'
      $video_cards = 'intel nouveau'
    }
    'AMD Turion(tm) II Neo N54L Dual-Core Processor': {
      $role = 'server'
      $cpu_flags = '3dnow 3dnowext mmx mmxext popcnt sse sse2 sse3 sse4a'
    }
    'Intel(R) Xeon(R) CPU W3520 @ 2.67GHz':           {
      $role = 'server'
      $cpu_flags = 'mmx mmxext popcnt sse sse2 sse3 sse4_1 sse4_2 ssse3'
    }
    default:                                          {
      $role = undef
    }
  }

  if $role == undef { fail('Host not defined in site.pp!') }

  include bash
  include portage
  include vim

  if $role == 'pc' {
    include xinit
  }
}
