# --                                                            ; {{{1
#
# File        : modules/dot/manifests/file.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-09-16
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

define dot::file (
  $spec = title,
  $mode = 600,
) {
  $spec_split = split($spec, '\s+')
  $user       = $spec_split[0]
  $file       = $spec_split[1]
  $home       = $spec_split[2]

  if $home == undef {
    $home_dir = "/home/${user}"
  } else {
    $home_dir = $home
  }

  file { "${home_dir}/${file}":
    ensure  => present,
    owner   => $user,
    group   => $user,
    mode    => $mode,
    source  => [
      "puppet:///modules/site/dot-${file}-${user}.${::fqdn}",
      "puppet:///modules/dot/dot-${file}-${user}.${::fqdn}",
      "puppet:///modules/site/dot-${file}-default.${::fqdn}",
      "puppet:///modules/dot/dot-${file}-default.${::fqdn}",
      "puppet:///modules/site/dot-${file}-${user}.${::hostname}",
      "puppet:///modules/dot/dot-${file}-${user}.${::hostname}",
      "puppet:///modules/site/dot-${file}-default.${::hostname}",
      "puppet:///modules/dot/dot-${file}-default.${::hostname}",
      "puppet:///modules/site/dot-${file}-${user}",
      "puppet:///modules/dot/dot-${file}-${user}",
      "puppet:///modules/site/dot-${file}-default",
      "puppet:///modules/dot/dot-${file}-default",
    ],
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
