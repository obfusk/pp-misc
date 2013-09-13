@slow @tmpdir @pp-misc @git
Feature: git tests

  Scenario: test1

    When  I run `FILE=modules/git/tests/repo/test1.pp rake apply:file` with bash
    Then  it should succeed
    And   the last stdout should match:
      """
      notice: /Stage\[main\]//Git::Repo\[\S+/pp-misc-git-repo-oc-1\]/Exec\[\[git clone\] \S+/pp-misc-git-repo-oc-1\]/returns: executed successfully
      """
    When  I run `test -d $TESTDIR/pp-misc-git-repo-oc-1/.git` with bash
    Then  it should succeed
    When  I run `cd $TESTDIR/pp-misc-git-repo-oc-1 && git branch` with bash
    Then  it should succeed
    And   the last stdout should be:
      """
      * gh-pages

      """

  Scenario: test2

    When  I run `FILE=modules/git/tests/repo/test2.pp rake apply:file` with bash
    Then  it should succeed
    And   the last stdout should match:
      """
      notice: /Stage\[main\]//Git::Repo\[\S+/pp-misc-git-repo-oc-2\]/Exec\[\[git clone\] \S+/pp-misc-git-repo-oc-2\]/returns: Cloning into '\S+/pp-misc-git-repo-oc-2'...
      notice: /Stage\[main\]//Git::Repo\[\S+/pp-misc-git-repo-oc-2\]/Exec\[\[git clone\] \S+/pp-misc-git-repo-oc-2\]/returns: executed successfully
      notice: /Stage\[main\]//Git::Repo\[\S+/pp-misc-git-repo-oc-2\]/Exec\[\[git pull\] \S+/pp-misc-git-repo-oc-2\]/returns: executed successfully
      """
    When  I run `test -d $TESTDIR/pp-misc-git-repo-oc-2/.git` with bash
    Then  it should succeed
    When  I run `cd $TESTDIR/pp-misc-git-repo-oc-2 && git branch` with bash
    Then  it should succeed
    And   the last stdout should be:
      """
      * gh-pages

      """

  Scenario: test3

    When  I run `FILE=modules/git/tests/repo/test3.pp rake apply:file` with bash
    Then  it should succeed
    And   the last stdout should match:
      """
      notice: /Stage\[main\]//Git::Repo\[\S+/pp-misc-git-repo-gitbak\]/Exec\[\[git clone\] \S+/pp-misc-git-repo-gitbak\]/returns: Cloning into '\S+/pp-misc-git-repo-gitbak'...
      notice: /Stage\[main\]//Git::Repo\[\S+/pp-misc-git-repo-gitbak\]/Exec\[\[git clone\] \S+/pp-misc-git-repo-gitbak\]/returns: executed successfully
      notice: /Stage\[main\]//Git::Repo\[\S+/pp-misc-git-repo-gitbak\]/Exec\[\[git checkout\] \S+/pp-misc-git-repo-gitbak\]/returns: Switched to a new branch 'v0.4.2-branch'
      notice: /Stage\[main\]//Git::Repo\[\S+/pp-misc-git-repo-gitbak\]/Exec\[\[git checkout\] \S+/pp-misc-git-repo-gitbak\]/returns: executed successfully
      """
    When  I run `test -d $TESTDIR/pp-misc-git-repo-gitbak/.git` with bash
    Then  it should succeed
    When  I run `cd $TESTDIR/pp-misc-git-repo-gitbak && git describe` with bash
    Then  it should succeed
    And   the last stdout should be:
      """
      v0.4.2

      """
