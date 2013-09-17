@slow @tmpdir @pp-misc @ffile
Feature: ffile tests

  Scenario: ffile

    When  I run `mkdir -p $TESTDIR/__ffile_tests__/some` with bash
    Then  it should succeed
    When  I run `FILE=modules/ffile/tests/init.pp rake apply:file` with bash
    Then  it should succeed
    And   the last stdout should match:
      """
      /Stage\[main\]//Ffile\[\S+/__ffile_tests__/some/file\]/File\[\S+/__ffile_tests__/some/file\]/ensure: defined content as '{md5}5febbef14389ebcfc3e501fa1091adcb'
      """
    When  I run `cat $TESTDIR/__ffile_tests__/some/file` with bash
    Then  it should succeed
    And   the last stdout should be:
      """
      some data

      """
