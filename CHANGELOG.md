# Fauxhai Changelog

## v6.0.1 (2018-03-07)

- Updated the deprecation warning to now show the date files will be removed as 3/2019 in the Fauxhai 7.0 release.

## v6.0.0 (2018-03-07)

### Removed Deprecated Platforms

All previously deprecated platforms have been removed. If you previously saw deprecation messages when running fauxhai/chefspec you will now see a hard error message linking to the list of supported platforms. This allows us to keep the Fauxhai gem size reasonable and also allows us to remove files that were dumped with very old versions of Chef (10/11).

### New Deprecations

Multiple platform versions are now marked as deprecated and will begin throwing warning messages during ChefSpec runs. This continues the goal of providing only up to date fauxhai dumps using recent builds of Chef. Since regenerating fauxhai data against new releases of Chef involves manually installing each version of distros we're limiting the number of point releases we'll support. This mostly impacts distros such as Debian/RHEL that release many point releases for the same major version.

#### Newly Deprecated Platforms:

- CentOS 5.10 / 6.7 / 7.2.1511
- Debian 7.10 / 8.7 / 8.8 / 9.0 / 9.1
- Fedora 24 / 25
- FreeBSD 11
- openSUSE 13.2 / 42.1
- Oracle 5.10 / 7.2
- RedHat 5.10 / 7.2

### Other Changes

- Added openBSD 6.2 data
- Fauxhai now handles situations where it can fetch new platform data from Github, but can't write it to disk due to lack of permissions. This is pretty common in CI systems like Travis. Previously we'd fail, but no we'll use the data without writing it to disk. This will require fetching it every time, but avoids failures.

## v5.6.0 (2018-01-17)

- Add new platform data:

  - `Debian` 9.3, 8.10
  - `Fedora` 27
  - `FreeBSD` 10.4

## v5.5.0 (2017-11-07)

- Added new platform data:

  - `Debian` 9.2
  - `macOS` 10.13
  - `Amazon Linux` 2017.09

## v5.4.0 (2017-09-15)

- Set the date for the removal of all deprecated platform data to 3/2018 to coincide with ChefDK 3.0
- Removed several non-critical files from the Gemfile to slim the package size down slightly
- Added new platform data:

  - `Redhat` 7.4
  - `Oracle` 7.4
  - `SUSE Enterprise Linux` 12.3 (aka 12 SP3)
  - `CentOS` 7.4

## v5.3.0 (2017-07-31)

- Added new platform data:

  - `Debian` 8.9, 9.1
  - `FreeBSD` 11.1
  - `Fedora` 26
  - `Windows` 2016
  - `openSUSE` 42.3

## v5.2.0 (2017-06-21)

- Added new platform data:

  - `Redhat` 5.11, 6.9
  - `Gentoo` 4.9.6-gentoo-r1

- Platform versions updated for Chef 13:

  - `Solaris` 5.10
  - `Redhat` 5.10, 6.8, 7.2, 7.3
  - `SUSE Enterprise Linux` 11.4

- Newly deprecated platform versions:

  - `Gentoo` 4.2
  - `openBSD` 5.4
  - `Redhat` 5.9, 6.7
  - `Slackware` 14.1

## v5.1.0 (2017-06-20)

- Added new platform data:

  - `Oracle Linux` 5.11, 6.9, 7.3
  - `Debian` 9.0
  - `DragonflyBSD` 4.8-RELEASE

- Platform versions updated for Chef 13:

  - `Oracle Linux` 5.10, 6.8, 7.2
  - `SUSE Enterprise Linux` 12.1, 12.2

- Newly deprecated platform versions:

  - `DragonflyBSD` 4.2-RELEASE

## v5.0.0 (2017-06-12)

- Added new platform data:

  - `Arch` 4.10.13-1-ARCH
  - `Amazon` Linux 2017.03
  - `CentOS` 6.9
  - `ClearOS` 7.0
  - `Debian` 8.8
  - `Linux Mint` 18.1

- Regenerated multiple platform data files to include Ohai 13 data, better mocked network data, and additional Ohai plugin data that is now whitelisted:

  - `Amazon Linux`
  - `CentOS`
  - `Debian`
  - `Fedora`
  - `macOS`
  - `openSUSE`
  - `Solaris`
  - `Ubuntu`
  - `Windows`

- Added a new system to allow deprecating old Fauxhai platform data with a warning shown during ChefSpec. This will allow us to deprecate data for platforms which have been marked End of Life by their maintainers. The following platforms have been marked as deprecated, but will continue to function until they are removed at a future date:

  - `Arch`: 4.5.4-1-ARCH, 4.9.11-1-ARCH
  - `CentOS`: 5.0, 5.1, 5.2, 5.3, 5.3, 5.4, 5.5, 5.6, 5.7, 5.8, 5.9, 6.0, 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 7.0, 7.0.1406, 7.1.1503
  - `Debian`: 7.2, 7.4, 7.5, 7.6, 7.7, 7.8, 7.9, 8.0, 8.1, 8.2, 8.4, 8.5, 8.6
  - `Fedora`: 21, 22, 23
  - `FreeBSD`: 9.3, 10.1, 10.2
  - `MacOS`: 10.9.2, 10.11.1 (replaced by 10.11)
  - `omnios`: 151014
  - `openSUSE`: 12.3, 13.1
  - `oracle`: 5.8, 6.5, 6.6, 7.0, 7.1
  - `redhat`: 5.6, 5.7, 5.8, 6.0, 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 7.0, 7.1
  - `smartos`: joyent_20130111T180733Z
  - `suse`: 11.3, 12.0
  - `ubuntu`: 12.04, 15.04, 15.10
  - `windows`: 2003R2, 8

- Data provided by the chef_packages will no longer be mocked, but instead the actual Ohai data will be used. This corrects incorrect paths to the Chef/Ohai binaries on many platforms

- Update the chef/ohai dependencies to allow for Chef/Ohai 13

- Improve the mocked Network data to return more platform appropriate network information.

- Whitelisted additional Ohai plugins to provide better mocked data

  - idletime_seconds
  - idle
  - machinename
  - packages
  - fips
  - block_device
  - time
  - shard_seed
  - shells

- Remove backwards compatibility with ChefSpec < 0.9.0 which was released 5 years ago

- Improve error messages when the platform data cannot be fetched remotely

- Fix the logic for enabling / disabling the Github fetching being backwards

## v4.1.0 (2017-03-27)

- Add a new config option "github_fetching" that disables fetching platform mocks from Github

## v4.0.2 (2017-03-20)

- Link to the platforms.md file in the platform not found exception messages

## v4.0.1 (2017-03-09)

- Added a new platforms.md file in this repo that lists all current platforms and versions available. This is generated with a new Rake task
- Updated the error text received when no platform/version is specified to be more clear what fields are missing

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

[#133]: https://github.com/chefspec/fauxhai/issues/133
[#18]: https://github.com/chefspec/fauxhai/issues/18
[#19]: https://github.com/chefspec/fauxhai/issues/19
[#21]: https://github.com/chefspec/fauxhai/issues/21
[#23]: https://github.com/chefspec/fauxhai/issues/23
[#24]: https://github.com/chefspec/fauxhai/issues/24
[#25]: https://github.com/chefspec/fauxhai/issues/25
[#26]: https://github.com/chefspec/fauxhai/issues/26
[#29]: https://github.com/chefspec/fauxhai/issues/29
[#30]: https://github.com/chefspec/fauxhai/issues/30
[#32]: https://github.com/chefspec/fauxhai/issues/32
[#51]: https://github.com/chefspec/fauxhai/issues/51
[@anujbiyani]: https://github.com/anujbiyani
[@benbytheway]: https://github.com/benbytheway
[@mapleoin]: https://github.com/mapleoin
[@pschultz]: https://github.com/pschultz
[@sax]: https://github.com/sax
[@tmatilai]: https://github.com/tmatilai
