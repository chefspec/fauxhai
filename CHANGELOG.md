# Fauxhai Changelog

## v4.0.0 (2017-03-06)

### New Platform Data

- openSUSE 42.2
- Redhat 7.3
- Debian 8.7
- CentOS 7.3.1611
- Fedora 25
- Arch 4.9.11-1-ARCH
- Suse Enterprise 12.2

### Updated Platform Data

These platforms have been redumped using Chef 12.19 to get the latest Ohai data

- openSUSE 42.1
- CentOS 6.8
- FreeBSD 10.3 / 11.0
- Redhat 6.6 / 6.7 / 6.8 / 7.0 / 7.1 / 7.2
- Suse Enterprise 12.0
- Ubuntu 14.04 / 16.04
- Debian 7.11

### Removed Platform Data

The following platforms were removed as they were long ago EOL'd by their maintainers and in most cases they were dumped with Chef 10/11 data that is no longer valid.

- Arch 3.10.5-1-ARCH
- Debian 6.0.5
- Debian jessie/stretch which were also incorrectly named as sid
- Fedora 18 / 19 / 20
- FreeBSD 8.4 / 9.1 / 9.2 / 10.0
- Gentoo 2.1
- macOS 10.6.8 / 10.7.4 / 10.8.2
- omniOS 151002 / 151006 / 151008
- Suse Enterprise 11.1 / 11.2
- Ubuntu 10.04 / 13.04 / 13.10 / 14.10

## v3.10.0

- Added macOS 10.12
- Added Amazon 2016.09
- Added FreeBSD 11.0
- Added Debian 8.6
- Require Ruby 2.2.2 or later
- Add init_package attribute to OpenSuse 13.2

## v3.9.0

- Added a new deprecation warning when someone doesn't provide a platform to mock. Previously we silently returned the Chefspec platform, which is probably not what anyone wanted / expected.
- Added Redhat 7.2
- Added Suse 12.1 and 11.4
- Added Windows 7
- Regenerated Windows 8, 8.1, and 10

## v3.8.0

- Added init_package attribute to existing CentOS/Oracle/Ubuntu/Debian platforms
- Added Debian 8.5
- Added Fedora 24
- Added Oracle Linux 5.8, 6.8, and regenerated 7.2 on VirtualBox to match others

## v3.7.0

- Fauxhai now requires at least Ruby 2.1.0
- Added Raspbian 8.0

## v3.6.0

- Generate proper data for Windows hosts
- Generate prefixlen as 23 not 24
- Fix the routes data to match the current Ohai format (hash instead of array of hash)
- Add root_group of wheel on previous FreeBSD system dumps

## v3.5.0

- Fauxhai now requires at least Ruby 2.0
- Added CentOS 6.8, Arch 4.5.4-1-ARCH, Debian 7.10, Gentoo 2.2
- Fixed the naming and bad JSON in Amazon 2016.03
- Updated the raw Github URL to Github's recommended URL
- Fixed the Rake task to properly fail if JSON files fail to validate

## v3.4.0

- Added Ubuntu 16.04, Debian 8.4, FreeBSD 10.3, and OmniOS r151018

## v3.3.0

- Updated AIX with latest Ohai data

## v3.2.0

- Updated OS X 10.11 to include root_group and kernel processor information
- Recaptured Solaris 5.11 with the latest Ohai
- Updated CPU attributes and fixed memory to be in kB on Solaris 5.10
- Added node['virtualization']['systems'] = {} to the runner and updated data in existing dumps
- Updated the runner to mock out chef_packages install paths using Omnibus paths not gem install paths and added it to existing dumps.

## v3.1.0

- Added collection of root_group, init_package, and cpu cores to the runner
- Added root_group to existing Linux systems
- Added Fedora 23, openSUSE Leap 42.1, and CentOS 7.2.1511
- Fixed malformed JSON in the Windows 2012 output
- Updated the runner and existing platform files to represent total memory in kB not MB as the default for Ohai has been changed on Windows / Linux
- Added cpu cores to all existing platform files
- Added a Rake task to validate the JSON of all platform files, and enabled Travis to run this task on every PR

## v3.0.1

- Change dependency for Chef and Ohai to a development dependency. The previous dependency on Chef 12 prevented Fauxhai from working with Chefspec on pre-12 Chef releases.

## v3.0.0

- Regenerated json files for all currently supported versions of Ubuntu, CentOS, FreeBSD, Debian, Fedora, and OpenSUSE. This new data is generated with Ohai output from Ohai 8.7.0 in Chef 12.5.1\. This data is more accurate for mocking out current Chef setups, but is changed from the previous Fauxhai 2.3.0 release. If you relied on specific mocked data this may require updating your specs.

## v2.3.0

- Annual release to add new versions bundled in the gem automatically ([#133])

## v2.2.0

- Fix an issue where OpenURI's error was not caught properly
- Add `memory` output to Fauxhai

## v2.1.2

- Fix an issue when Chef is not installed on the system
- Add basic --version and --help flags
- Use fauxhai/version

## v2.1.1

- Switch to OpenURI (#99)

## v2.1.0

- Add CPU stanza information to all platforms

## v2.0.1

Released 2013-12-12

- Fix critical error on networking interfaces ([@benbytheway], [#51])

## v2.0.0

Released 2013-11-06

- Remove dependency on HTTParty
- Require Ruby 1.9

## v1.1.1

Released 2013-06-03

- Add new LSB release information ([@pschultz], [#32])

## v1.1.0

Released: 2013-05-21

- Fix typo in README ([@mapleoin], [#29])
- Rename `gem` to `spec` in gemspec
- Use Ruby's built-in JSON class
- Handle use case where an entire new operating system is created (15708ce)
- Add openSUSE 12.3 ([@mapleoin], [#30])

## v1.0.0

Released: 2013-05-09

- Support `path` option to specify the fixture data ([#21])
- Require `version` option for platform, drop (undocumented) support for default versions ([#25], [#26])
- Update gem paths on Ubuntu 10.04 data ([@anujbiyani], [#18], [#19])
- Add SmartOS joyent_20130111T180733Z ([@sax], [#23])
- Add Debian 7.0 (Wheezy) ([@tmatilai], [#24])
- <!-- - The following link definition list is generated by PimpMyChangelog - -->

[#133]: https://github.com/customink/fauxhai/issues/133
[#18]: https://github.com/customink/fauxhai/issues/18
[#19]: https://github.com/customink/fauxhai/issues/19
[#21]: https://github.com/customink/fauxhai/issues/21
[#23]: https://github.com/customink/fauxhai/issues/23
[#24]: https://github.com/customink/fauxhai/issues/24
[#25]: https://github.com/customink/fauxhai/issues/25
[#26]: https://github.com/customink/fauxhai/issues/26
[#29]: https://github.com/customink/fauxhai/issues/29
[#30]: https://github.com/customink/fauxhai/issues/30
[#32]: https://github.com/customink/fauxhai/issues/32
[#51]: https://github.com/customink/fauxhai/issues/51
[@anujbiyani]: https://github.com/anujbiyani
[@benbytheway]: https://github.com/benbytheway
[@mapleoin]: https://github.com/mapleoin
[@pschultz]: https://github.com/pschultz
[@sax]: https://github.com/sax
[@tmatilai]: https://github.com/tmatilai
