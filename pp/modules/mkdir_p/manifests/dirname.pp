# --                                                            ; {{{1
#
# File        : modules/mkdir_p/manifests/dirname.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-09-16
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

define mkdir_p::dirname (
  $path = $title,
  $log  = on_failure,
  $user = undef,
) {
  $path_sh  = shellquote($path)
  $dn       = "\"$( dirname ${path_sh} )\""

  exec { "[mkdir_p::dirname] ${path}":
    command   => "mkdir -p ${dn}",
    unless    => "test -d ${dn}",
    logoutput => $log,
    user      => $user,
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
