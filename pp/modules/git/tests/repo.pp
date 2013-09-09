git::repo { "${::TESTDIR}/pp-misc-1":
  source    => 'https://github.com/obfusk/pp-misc.git',
  branch    => 'dev',               # TODO
  log       => on_failure,
}

git::repo { "${::TESTDIR}/pp-misc-2":
  source    => 'https://github.com/obfusk/pp-misc.git',
  branch    => 'dev',
  pull      => true,
  log_pull  => on_failure,
}

git::repo { "${::TESTDIR}/pp-misc-3":
  source    => 'https://github.com/obfusk/pp-misc.git',
  checkout  => ['foo', '1df4e76'],  # TODO
}
