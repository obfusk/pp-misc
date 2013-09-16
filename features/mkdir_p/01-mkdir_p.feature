@slow @tmpdir @pp-misc @mkdir_p
Feature: git tests

  Scenario: mkdir_p

    When  I run `FILE=modules/mkdir_p/tests/init.pp rake apply:file` with bash
    Then  it should succeed
    And   the last stdout should match:
      """
      /Stage\[main\]//Mkdir_p\[\S+/some/dir1\]/Exec\[\[mkdir_p\] \S+/some/dir1\]/returns: executed successfully
      """
    When  I run `test -d $TESTDIR/some/dir1` with bash
    Then  it should succeed

  Scenario: mkdir_p::dirname

    When  I run `FILE=modules/mkdir_p/tests/dirname.pp rake apply:file` with bash
    Then  it should succeed
    And   the last stdout should match:
      """
      /Stage\[main\]//Mkdir_p::Dirname\[\S+/some/dir2/file\]/Exec\[\[mkdir_p::dirname\] \S+/some/dir2/file\]/returns: executed successfully
      """
    When  I run `test -d $TESTDIR/some/dir2` with bash
    Then  it should succeed
