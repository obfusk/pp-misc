# --                                                            ; {{{1
#
# File        : modules/ffile/manifests/init.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-09-17
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

define ffile (
  $path   = $title,
  $from   = undef,
  $owner  = undef,
  $group  = undef,
  $mode   = undef,
) {
  if $from == undef {
    $f = $path
  } else {
    $f = $from
  }

  file { $path:
    ensure  => present,
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    source  => [
      "puppet:///modules/site/ffile/${f}-${::fqdn}",
      "puppet:///modules/ffile/${f}-${::fqdn}",
      "puppet:///modules/site/ffile/${f}-${::hostname}",
      "puppet:///modules/ffile/${f}-${::hostname}",
      "puppet:///modules/site/ffile/${f}",
      "puppet:///modules/ffile/${f}",
    ],
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
