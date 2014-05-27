
#### [Current]
 * [554f1a8](../../commit/554f1a8) - __(Joshua Hoblitt)__ add boilerplate Versioning/See Also sections to README
 * [aee2b37](../../commit/aee2b37) - __(Joshua Hoblitt)__ remove README section on stdlib

This section has not be relevant since commit
e1962ecd9dc93278121523e3d6d35e740af172ca.

 * [6afbfdc](../../commit/6afbfdc) - __(Joshua Hoblitt)__ add `:require => false` to all Gemfile gems
 * [aecaa3a](../../commit/aecaa3a) - __(Joshua Hoblitt)__ change .fixtures.yml to use https:// instead of git://
 * [0fba3b0](../../commit/0fba3b0) - __(Joshua Hoblitt)__ update .gitignore
 * [dc7b383](../../commit/dc7b383) - __(Joshua Hoblitt)__ Merge pull request [#1](../../issues/1) from jhoblitt/feature/drop_bundled_merge_function

Feature/drop bundled merge function
 * [68dc8fc](../../commit/68dc8fc) - __(Joshua Hoblitt)__ remove bundled pureftpd_merge() function

The pureftpd_merge() function included in this module is a copy of the
stdlib merge() function from commit id
f496005bf3db8a5202bf9c16daf9a524b178c67a.  This version of merge()
includes a critical bug fix that was commit after the stdlib 4.1.0
release.  Now that stdlib 4.2.0 has been released (finally!) with the
needed fix, bundling a version of the merge() function in this module is
no longer necessary.

#### v1.1.0
 * [95265a0](../../commit/95265a0) - __(Joshua Hoblitt)__ bump version to v1.1.0
 * [56637b4](../../commit/56637b4) - __(Joshua Hoblitt)__ update travis matrix
 * [e1962ec](../../commit/e1962ec) - __(Joshua Hoblitt)__ give up all hope of a post stdlib 4.1.0 release happening

This module is dependant the behavior of the stdlib merge() function as
of commit f496005bf3db8a5202bf9c16daf9a524b178c67a, which was merged
after lastest (4.1.0) release.  Since that release is almost a year old
now, it's looking unlikely that there will be another release in the
near future.

As a workaround, the merge() function has been copied into this module as
pureftpd_merge() and the Module dep as been reduced to stdlib >= 4.0.0.

 * [30bd33d](../../commit/30bd33d) - __(Joshua Hoblitt)__ replace rspec include_class matcher with contain_class

To fix this warning with rspec-puppet >= 1.0.0:

    DEPRECATION: include_class is deprecated. Use contain_class instead

#### v1.0.3
 * [0795ca3](../../commit/0795ca3) - __(Joshua Hoblitt)__ bump version to v1.0.3
 * [898bb72](../../commit/898bb72) - __(Joshua Hoblitt)__ unmark README pure-ftpd.conf examples as puppet code
 * [f5a4b5e](../../commit/f5a4b5e) - __(Joshua Hoblitt)__ add GFMD highlighting to README
 * [7b4e426](../../commit/7b4e426) - __(Joshua Hoblitt)__ update README ToC

#### v1.0.2
 * [7dc27d7](../../commit/7dc27d7) - __(Joshua Hoblitt)__ bump version to v1.0.2
 * [4b25bd6](../../commit/4b25bd6) - __(Joshua Hoblitt)__ doc dependency on an unreleased version of stdlib
 * [b3310d8](../../commit/b3310d8) - __(Joshua Hoblitt)__ suppress lint 80char warning
 * [73cbca7](../../commit/73cbca7) - __(Joshua Hoblitt)__ add puppet 3.3.0 to travis test matrix
 * [fb20c66](../../commit/fb20c66) - __(Joshua Hoblitt)__ puppet-lint should ignore pkg/**

#### v1.0.1
 * [d35098c](../../commit/d35098c) - __(Joshua Hoblitt)__ update Modulefile version to v1.0.1
 * [964a3f0](../../commit/964a3f0) - __(Joshua Hoblitt)__ fix minor typos and line wrapping in README

#### v1.0.0
 * [6fe72c8](../../commit/6fe72c8) - __(Joshua Hoblitt)__ fix module name in Modfulefile
 * [4644352](../../commit/4644352) - __(Joshua Hoblitt)__ remove templates/redhat dir since no templates are `$::osfamily` specific
 * [0b9c50b](../../commit/0b9c50b) - __(Joshua Hoblitt)__ minor README tweak
 * [462d1f8](../../commit/462d1f8) - __(Joshua Hoblitt)__ add complete list of `pure-ftpd.conf` options to README
 * [d7cd213](../../commit/d7cd213) - __(Joshua Hoblitt)__ add additional `pure-ftpd.conf` options

Support for these options:
 * UnixAuthentication
 * PAMAuthentication
 * TLSCipherSuite

 * [ae03a97](../../commit/ae03a97) - __(Joshua Hoblitt)__ fix README typo
 * [95ef983](../../commit/95ef983) - __(Joshua Hoblitt)__ overhaul class pureftpd tests
 * [38097ad](../../commit/38097ad) - __(Joshua Hoblitt)__ add $config_mysql param to class pureftpd
 * [1c81250](../../commit/1c81250) - __(Joshua Hoblitt)__ add tests for pureftpd::{install,params,service}
 * [187c3f0](../../commit/187c3f0) - __(Joshua Hoblitt)__ pure-ftpd sysv init.d script supports the status command
 * [7392746](../../commit/7392746) - __(Joshua Hoblitt)__ fix indent width in pureftpd::service
 * [888dd0c](../../commit/888dd0c) - __(Joshua Hoblitt)__ improve consistency of class pureftpd::config* tests
 * [b3191a3](../../commit/b3191a3) - __(Joshua Hoblitt)__ remove stale tests dir
 * [5ae1ce1](../../commit/5ae1ce1) - __(Joshua Hoblitt)__ Merge puppet-module_skel
 * [afb41e2](../../commit/afb41e2) - __(Joshua Hoblitt)__ major doc update
 * [1b4573a](../../commit/1b4573a) - __(Joshua Hoblitt)__ update modulefile dep on stdlib to >= 4.1.0

It turns out that slightly older versions of merge() don't deal well
with undefined variables

 * [c602ae9](../../commit/c602ae9) - __(Joshua Hoblitt)__ fix notify pureftpd::service on config* classes from pureftpd class
 * [959a617](../../commit/959a617) - __(Joshua Hoblitt)__ more README commas for fun and profit
 * [72dc2e6](../../commit/72dc2e6) - __(Joshua Hoblitt)__ README typo
 * [8be02d1](../../commit/8be02d1) - __(Joshua Hoblitt)__ replace condition unless with if ! for puppet 2.7.x compat
 * [ee08ab9](../../commit/ee08ab9) - __(Joshua Hoblitt)__ @zaphod42's commas
 * [8f590be](../../commit/8f590be) - __(Joshua Hoblitt)__ add config_pgsql param to class pureftpd
 * [df44134](../../commit/df44134) - __(Joshua Hoblitt)__ update pureftpd::config::mysql to use the common erb template + rspec
 * [ab4cfb9](../../commit/ab4cfb9) - __(Joshua Hoblitt)__ update pureftpd::config::pgsql to use the common erb template + rspec
 * [f50f4db](../../commit/f50f4db) - __(Joshua Hoblitt)__ doc source of options for pure-ftpd.conf & pureftpd-ldap.conf
 * [3f87b61](../../commit/3f87b61) - __(Joshua Hoblitt)__ remove duplicate check/typo
 * [0242a33](../../commit/0242a33) - __(Joshua Hoblitt)__ mv all pureftpd::service notification into pureftpd class
 * [5abd649](../../commit/5abd649) - __(Joshua Hoblitt)__ add config_ldap param to class pureftpd

To allow passing a hash of pureftpd-ldap.conf configuration values
through to class pureftpd::config::ldap

 * [c3e8fdd](../../commit/c3e8fdd) - __(Joshua Hoblitt)__ improve contexts in pureftpd::config rspec
 * [d50e2af](../../commit/d50e2af) - __(Joshua Hoblitt)__ add missing configuration options/params to pureftpd::config + rspec
 * [d7ebceb](../../commit/d7ebceb) - __(Joshua Hoblitt)__ add missing $ldapserver param to pureftpd::config::ldap
 * [3f7ec70](../../commit/3f7ec70) - __(Joshua Hoblitt)__ fix or disable linter issues
 * [889e3e8](../../commit/889e3e8) - __(Joshua Hoblitt)__ fix pureftpd config parameter test

Add missing newline escape.  Workins locally for some reason but is breaking on
travis-ci

 * [f5fc23b](../../commit/f5fc23b) - __(Joshua Hoblitt)__ add config param to class pureftpd

To allow passing a hash of pure-ftpd.conf configuration values through to class
pureftpd::config

 * [a22b60a](../../commit/a22b60a) - __(Joshua Hoblitt)__ add travis-ci build placard
 * [9eaf2f3](../../commit/9eaf2f3) - __(Joshua Hoblitt)__ enable travis-ci
 * [d56464f](../../commit/d56464f) - __(Joshua Hoblitt)__ refactor pureftpd::config similar to pureftpd::config::ldap

to allow the same erb template to be shared between pureftpd::config and
pureftpd::config::ldap

 * [d351586](../../commit/d351586) - __(Joshua Hoblitt)__ mv pureftpd::config_{ldap,mysql,pgsql} -> pureftpd::config::{ldap,mysql,pgsql}
 * [7e1aa36](../../commit/7e1aa36) - __(Joshua Hoblitt)__ remove unused class parameters/docs from pureftpd::config_{mysql,pgsql}
 * [1e51466](../../commit/1e51466) - __(Joshua Hoblitt)__ remove stale pureftpd::config_ldap docs
 * [ddb63b7](../../commit/ddb63b7) - __(Joshua Hoblitt)__ reorder inheritance chain and refactor pureftpd::config_ldap
 * [5230121](../../commit/5230121) - __(Joshua Hoblitt)__ whitespace tidy manifests/config.pp
 * [3494b33](../../commit/3494b33) - __(Joshua Hoblitt)__ add test for class pureftpd with $use_selinux
 * [5b258e1](../../commit/5b258e1) - __(Joshua Hoblitt)__ move *conf file path and erb path selection into pureftpd::params
 * [d178271](../../commit/d178271) - __(Joshua Hoblitt)__ s/\r\n/\n/g
 * [53b9f74](../../commit/53b9f74) - __(Joshua Hoblitt)__ convert pureftpd::config_pgsql from a define into a class
 * [d8bff85](../../commit/d8bff85) - __(Joshua Hoblitt)__ convert pureftpd::config_mysql from a define into a class
 * [cdb93ba](../../commit/cdb93ba) - __(Joshua Hoblitt)__ add trivial pureftpd class rspec
 * [6cd6c2e](../../commit/6cd6c2e) - __(Joshua Hoblitt)__ replace old unused rspec cruft with a clean template
 * [05c7d97](../../commit/05c7d97) - __(Joshua Hoblitt)__ git ignore Gemfile.lock
 * [6488ecb](../../commit/6488ecb) - __(Joshua Hoblitt)__ install ruby gems from https://rubygems.org instead of :rubygems

To resolve this warning:

   The source :rubygems is deprecated because HTTP requests are insecure.
   Please change your source to 'https://rubygems.org' if possible, or
   'http://rubygems.org' if not.

 * [7e74f57](../../commit/7e74f57) - __(Joshua Hoblitt)__ Merge puppet-module_skel
 * [35901b5](../../commit/35901b5) - __(Joshua Hoblitt)__ explicitly install pure-ftpd and pure-ftpd-selinux

when $::pureftpd::use_selinux is set

 * [89d2718](../../commit/89d2718) - __(Joshua Hoblitt)__ convert define pureftpd::config_ldap into a class
 * [dae9c20](../../commit/dae9c20) - __(Joshua Hoblitt)__ lowercase camel case template dir name
 * [9aa1ad3](../../commit/9aa1ad3) - __(Joshua Hoblitt)__ add ldap/mysql/pgsql parameters to pureftpd::config

As a replacement for `$default_auth` used the templates

 * [1296a7b](../../commit/1296a7b) - __(Joshua Hoblitt)__ restructure module so all classes for the inheritance hierarchy pureftpd -> pureftpd::params -> pureftpd::<foo>
 * [12b5798](../../commit/12b5798) - __(Joshua Hoblitt)__ convert pureftpd::config from a defined type into a class
 * [7a3749c](../../commit/7a3749c) - __(Joshua Hoblitt)__ properly fail on $::osfamily = debian
 * [9304d99](../../commit/9304d99) - __(Joshua Hoblitt)__ add pureftpd::config params for almost all pure-ftpd.conf variables
 * [53647ab](../../commit/53647ab) - __(Joshua Hoblitt)__ remove dep on the epel class (stahnma/puppet-module-epel)

This module does not have any provision for using local / private EPEL mirrors

 * [711ad35](../../commit/711ad35) - __(5Ub-Z3r0)__ Fixed: removed EPEL configuration, added dependency on stahnma/epel module
 * [422ccc7](../../commit/422ccc7) - __(5Ub-Z3r0)__ First commit
