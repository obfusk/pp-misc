git::repo { "${::TESTDIR}/pp-misc-git-repo-oc-1":
  source    => 'https://github.com/obfusk/obfusk.coffee.git',
  branch    => 'gh-pages',
  log       => on_failure,
}
