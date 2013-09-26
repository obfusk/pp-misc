[]: {{{1

    File        : README.md
    Maintainer  : Felix C. Stegerman <flx@obfusk.net>
    Date        : 2013-09-26

    Copyright   : Copyright (C) 2013  Felix C. Stegerman

[]: }}}1

## Description

  pp-misc - miscellaneous puppet modules

### ffile module

[]: {{{1

  The ffile module creates a file by copying the first existing file
  in:

  * `puppet:///modules/site/ffile/${f}-${::fqdn}`
  * `puppet:///modules/ffile/${f}-${::fqdn}`
  * `puppet:///modules/site/ffile/${f}-${::hostname}`
  * `puppet:///modules/ffile/${f}-${::hostname}`
  * `puppet:///modules/site/ffile/${f}`
  * `puppet:///modules/ffile/${f}`

#

  Where `$f` is either the `$path` of the file; or `$from`, if
  specified.

  Examples:

```puppet
ffile { "/some/file/some/where": }

ffile { "/some/other/file":
  from => 'some_other_file',
}

ffile { "/some/file/somewhere/else":
  owner => 'felix',
  group => 'felix',
  mode  => 600,
}
```

[]: }}}1

### git module

[]: {{{1

  The git module lets you clone a git repo to a specific path,
  optionally specifying a branch to clone, or a branch to checkout
  from a specific commit.  You can have puppet pull the repo every
  time it is run, or leave it alone after the initial clone.  You can
  specify whether git output should be shown by puppet; the user to
  run the command as; and the timeout.

  Requires: Package['git'].

  Examples:

```puppet
git::repo { "/path/to/dir1":
  source    => 'https://example.com/repo1.git',
  branch    => 'dev',
  log       => on_failure,
}

git::repo { "/path/to/dir2":
  source    => 'https://example.com/repo2.git',
  branch    => 'dev',
  pull      => true,
  log_pull  => on_failure,
}

git::repo { "/path/to/dir3":
  source    => 'https://example.com/repo3.git',
  checkout  => ['foo', '5321cbf'],
}
```

[]: }}}1

## mkdir\_p module

[]: {{{1

  The mkdir_p module lets you use `mkdir -p` from puppet.  Because
  creating a parent directory for a puppet-managed dir or file is also
  useful, there is also mkdir_p::dirname which `mkdir -p`'s the
  dirname of the specified path.

  Examples:

```puppet
mkdir_p { "/path/to/some/dir1": }
mkdir_p::dirname { "/path/to/some/dir2/file": }
```

[]: }}}1

## Tests
[]: {{{1

  To run the tests, you will need a meta-project like
  https://github.com/obfusk/pp-meta.

[]: }}}1

## TODO

  * test user/timeout?
  * more specs/docs?
  * ...

## License
[]: {{{1

  GPLv2 [1] or EPLv1 [2].

[]: }}}1

## References
[]: {{{1

  [1] GNU General Public License, version 2
  --- http://www.opensource.org/licenses/GPL-2.0

  [2] Eclipse Public License, version 1
  --- http://www.opensource.org/licenses/EPL-1.0

[]: }}}1

[]: ! ( vim: set tw=70 sw=2 sts=2 et fdm=marker : )
