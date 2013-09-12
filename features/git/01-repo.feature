@tmpdir @pp-misc @git
Feature: git tests

  Scenario: test1

    When  I run `FILE=modules/git/tests/repo/test1.pp rake apply:file` with bash
    Then  it should succeed
    And   the last stdout should be:
      """
      """

  Scenario: test2

    When  I run `FILE=modules/git/tests/repo/test2.pp rake apply:file` with bash
    Then  it should succeed
    And   the last stdout should be:
      """
      """

  Scenario: test3

    When  I run `FILE=modules/git/tests/repo/test3.pp rake apply:file` with bash
    Then  it should succeed
    And   the last stdout should be:
      """
      """
