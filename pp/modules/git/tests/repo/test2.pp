git::repo { "${::TESTDIR}/pp-misc-git-repo-oc-2":
  source    => 'https://github.com/obfusk/obfusk.coffee.git',
  branch    => 'gh-pages',
  pull      => true,
  log_pull  => on_failure,
}
