git::repo { "${::TESTDIR}/pp-misc-git-repo-oc-1":
  source    => 'https://github.com/obfusk/obfusk.coffee.git',
  branch    => 'gh-pages',
  log       => on_failure,
}

git::repo { "${::TESTDIR}/pp-misc-git-repo-oc-2":
  source    => 'https://github.com/obfusk/obfusk.coffee.git',
  branch    => 'gh-pages',
  pull      => true,
  log_pull  => on_failure,
}

git::repo { "${::TESTDIR}/pp-misc-git-repo-gitbak":
  source    => 'https://github.com/obfusk/gitbak.git',
  checkout  => ['v0.4.2-branch', 'v0.4.2'],
}
