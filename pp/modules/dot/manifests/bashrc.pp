# --                                                            ; {{{1
#
# File        : modules/dot/manifests/bashrc.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-09-16
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

define dot::bashrc (
  $user = $title,
  $home = undef,
  $mode = undef,
) {
  dot::file { "${user} .bashrc ${home}":
    mode => $mode,
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
