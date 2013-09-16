# --                                                            ; {{{1
#
# File        : modules/git/manifests/repo.pp
# Maintainer  : Felix C. Stegerman <flx@obfusk.net>
# Date        : 2013-09-16
#
# Copyright   : Copyright (C) 2013  Felix C. Stegerman
# Licence     : GPLv2 or EPLv1
#
# --                                                            ; }}}1

# NB: never use pull + checkout - doesn't make sense anyway!

define git::repo (
  $source,
  $path         = $title,
  $branch       = undef,
  $checkout     = undef, # [branch, tag_or_commit]
  $pull         = false,
  $log          = true,
  $log_clone    = undef,
  $log_pull     = undef,
  $log_checkout = undef,
  $user         = undef,
  $timeout      = undef,
) {
  if $branch == undef {
    $branch_arg = ''
  } else {
    $branch_sh  = shellquote($branch)
    $branch_arg = "-b ${branch_sh}"
  }

  if $log_clone == undef {
    $log_cl = $log
  } else {
    $log_cl = $log_clone
  }

  if $log_pull == undef {
    $log_pu = $log
  } else {
    $log_pu = $log_pull
  }

  if $log_checkout == undef {
    $log_ch = $log
  } else {
    $log_ch = $log_checkout
  }

  $clone_args = shellquote($source, $path)

  exec { "[git clone] ${path}":
    command   => "git clone ${branch_arg} ${clone_args}",
    creates   => "${path}/.git",
    logoutput => $log_cl,
    user      => $user,
    timeout   => $timeout,
    require   => Package['git'],
  }

  if $pull == true {
    exec { "[git pull] ${path}":
      command   => 'git pull',
      cwd       => $path,
      logoutput => $log_pu,
      user      => $user,
      timeout   => $timeout,
      require   => Exec["[git clone] ${path}"],
    }
  }

  if $checkout != undef {
    $checkout_branch  = shellquote($checkout[0])
    $checkout_commit  = shellquote($checkout[1])

    $checkout_args    = "${checkout_branch} ${checkout_commit}"
    $checkout_test    = '"$( git symbolic-ref HEAD )" = refs/heads/'

    exec { "[git checkout] ${path}":
      command   => "git checkout -b ${checkout_args}",
      unless    => "test ${checkout_test}${checkout_branch}",
      cwd       => $path,
      logoutput => $log_ch,
      user      => $user,
      timeout   => $timeout,
      require   => Exec["[git clone] ${path}"],
    }
  }
}

# vim: set tw=0 sw=2 sts=2 et fdm=marker :
