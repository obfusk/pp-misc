git::repo { "${::testdir}/pp-misc-git-repo-gitbak":
  source    => 'https://github.com/obfusk/gitbak.git',
  checkout  => ['v0.4.2-branch', 'v0.4.2'],
}
