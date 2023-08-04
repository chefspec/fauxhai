<!-- latest_release 9.3.10 -->
## [v9.3.10](https://github.com/chef/fauxhai/tree/v9.3.10) (2023-08-04)

#### Merged Pull Requests
- Add .buildkite folder to make pipeline_protection happy [#18](https://github.com/chef/fauxhai/pull/18) ([tpowell-progress](https://github.com/tpowell-progress))
<!-- latest_release -->

<!-- release_rollup since=9.3.8 -->
### Changes not yet released to rubygems.org

#### Merged Pull Requests
- Add .buildkite folder to make pipeline_protection happy [#18](https://github.com/chef/fauxhai/pull/18) ([tpowell-progress](https://github.com/tpowell-progress)) <!-- 9.3.10 -->
- Add Debian 12 support [#17](https://github.com/chef/fauxhai/pull/17) ([Justin-Fernbaugh](https://github.com/Justin-Fernbaugh)) <!-- 9.3.9 -->
<!-- release_rollup -->

<!-- latest_stable_release -->
## [v9.3.8](https://github.com/chef/fauxhai/tree/v9.3.8) (2023-05-05)

#### Merged Pull Requests
- Add Rocky Linux 9 data [#9](https://github.com/chef/fauxhai/pull/9) ([vkarve-chef](https://github.com/vkarve-chef))
- Added the SonarQube configuration [#13](https://github.com/chef/fauxhai/pull/13) ([nikhil2611](https://github.com/nikhil2611))
- Update fetcher to pull from correct repository [#14](https://github.com/chef/fauxhai/pull/14) ([ramereth](https://github.com/ramereth))
<!-- latest_stable_release -->

## [v9.3.5](https://github.com/chef/fauxhai/tree/v9.3.5) (2023-02-03)

#### Merged Pull Requests
- Add AlmaLinux 9 data [#8](https://github.com/chef/fauxhai/pull/8) ([vkarve-chef](https://github.com/vkarve-chef))
- CentOS Stream 8 &amp; 9 data [#10](https://github.com/chef/fauxhai/pull/10) ([ramereth](https://github.com/ramereth))
- Add Oracle 7 / 8 / 9 [#12](https://github.com/chef/fauxhai/pull/12) ([davidjkling](https://github.com/davidjkling))

## [v9.3.2](https://github.com/chef/fauxhai/tree/v9.3.2) (2022-06-13)

#### Merged Pull Requests
- Mimaslanka/dummy [#6](https://github.com/chef/fauxhai/pull/6) ([mimaslanka](https://github.com/mimaslanka))
- Force action [#7](https://github.com/chef/fauxhai/pull/7) ([mimaslanka](https://github.com/mimaslanka))

## 9.3.0 (2022-01-26)

- Add macOS 12
- Deprecate macOS 11.0 with a new macOS 11 taking it's place
- Deprecate FreeBSD 11.2 since this is EOL now

## 9.2.0 (2022-01-26)

- Add Alma Linux 8
- Add Rocky Linux 8

## 9.1.0 (2021-11-01)

### Updated Platforms

- Debian 10 updated to 10.11
- Debian 11 regenerated on AWS using Debian 11.1
- Suse 15 updated from 15.0 to 15.1
- Amazon 2 updated to tha latest release
- Ubuntu 18.04 / 20.04 updated to the latest releases
- Redhat 8 updated from 8.2 to 8.4

### New Platforms

- Debian 9.13
- Redhat 7.9

### Newly Deprecated Platforms (removal in April 2022)

- Redhat 7.7
- CentOS 7.7
- Debian 9.11
- Fedora 31
- Oracle 7.5
- Amazon 2018.03

## v9.0.1 (2021-11-01)

- Resolved a Ruby error when attempting to generate new Fauxhai data on a host
- Deprecated the SmartOS platform data dump
- Add Debian 11

## v9.0.0 (2021-04-07)

This release removes all previously deprecated Fauxhai definitions which have alerted during their use over the last year.  These platforms have been removed either due to the platform reaching end-of-life status with the vendor or newer minor releases of the platform being available in Fauxhai.

In general make sure to write ChefSpec tests that reference the major version (or no version at all) of the platform so that Fauxhai can automatically pick the latest version. Allowing Fauxhai to best chose the version of the minor or major platform release ensures your specs continue to run as new platforms are released and older Fauxhai data is removed.

To automatically migrate ChefSpec tests to use newer platforms you use the [Chef/Deprecations/DeprecatedChefSpecPlatform](https://docs.chef.io/workstation/cookstyle/chef_deprecations_deprecatedchefspecplatform/) Cookstyle cop, which will autocorrect many specs:

`cookstyle -a --only Chef/Deprecations/DeprecatedChefSpecPlatform`

### Platforms Removed

- AIX 6.1
- Amazon Linux 2015.03
- Amazon Linux 2015.09
- Amazon Linux 2016.03
- Amazon Linux 2016.09
- Amazon Linux 2017.03
- Amazon Linux 2017.09
- CentOS 5.11
- CentOS 6.9
- CentOS 7.5.1804
- CentOS 7.6.1810
- Debian 8.11
- Debian 9.8
- Debian 9.9
- Fedora 29
- Fedora 30
- FreeBSD  11.1
- Linux Mint 18.3
- macOS 10.13
- OpenSUSE 15.0
- OpenSUSE 15.1
- Oracle Linux 5.11
- Oracle Linux 6.9
- Red Hat Linux 5.11
- Red Hat Linux 6.9
- Red Hat Linux 7.4
- Red Hat Linux 7.5
- Red Hat Linux 7.6
- Suse Enterprise Linux 12.3
- Ubuntu 14.04
- Windows 20008 R2

## v8.7.1 (2021-04-03)

- Add files to the gem package to help with Chef Workstation bundling

## v8.7.0 (2020-12-31)

### Newly Deprecated Platforms (removal in April 2021)

- openSUSE 15.1
- Redhat 7.6
- CentOS 7.6
- Linux Mint 18.3
- All Amazon Linux 201X releases except 2018.03

## v8.6.0 (2020-12-01)

### New Platforms

- macOS 11

### Newly Deprecated Platforms (removal in April 2021)

- macOS 10.13

## v8.5.0 (2020-11-17)

### New Platforms

- AIX 7.2

### Updated Platforms

- AIX 7.1: Updated the Ohai dump from Chef Infra Client 14 to 16.7, which updates Ruby plugin data, filesystem plugin data, and shard plugin data.

## v8.4.0 (2020-11-09)

### New Platforms

- CentOS 7.8
- Red Hat 7.8
- Add openSUSE 15.2

### Updated Platforms

- Ubuntu 16.04 - 20.04
- Debian 9 & 10 releases
- Red Hat 7 and 8 releases
- openSUSE 15.1
- Fedora 31/32
- Amazon releases

## v8.3.1 (2020-08-17)

- Only require net/ssh if we're using the ssh functionality
- Add a rake task to generate a platforms.json file that can be parses out to determine all platforms

## v8.3.0 (2020-08-13)

### Newly Removed Platforms

- Removed the end of life Debian 8.9/8.10 definitions. If you still need to test EOL Debian 8 you can use Debian 8.11 for now.

### New Platforms

- Debian 9.12

### Updated Platforms

- Ubuntu 16.04 has been updated to 16.04.7
- Ubuntu 18.04 has been updated to 18.04.5
- Ubuntu 20.04 has been updated to 20.04.1
- CentOS 8 has been updated to 8.2

### Newly Deprecated Platforms (removal in April 2021)

- CentOS 6.9
- Debian 8.11
- Debian 9.8
- Debian 9.9
- openSUSE 15.0
- Oracle Linux 6.9

## v8.2.0 (2020-05-17)

### New Platforms

- SLES 12.5
- Fedora 32

### Updated Platforms

- Redhat 8 is now gathered using a Redhat 8.2 AMI
- Debian 10 is now gathering using a Debian 10.4 AMI
- CentOS 7.7 is now gathered using the official CentOS AMI

### Newly Deprecated Platforms (removal in April 2021)

- CentOS 7.5
- RHEL 7.5
- Fedora 30
- SLES 12.3

## v8.1.0 (2020-04-29)

### New Platforms

- Ubuntu 20.04
- openSUSE 15.1

### Updated Platforms

- macOS 10.15 has been updated to 10.15.4
- CentOS 8 updated from 8.0.1905 to 8.1.1911 and is now on AWS
- Most non-deprecated systems re-gathered using Chef Infra Client 16.0

### Newly Deprecated Platforms (removal in April 2021)

- Oracle 5.11
- Redhat 5.11
- CentOS 5.11

## v8.0.0 (2020-03-09)

### New Platforms

- Raspbian 10
- Fedora 31
- Redhat 7.7
- CentOS 7.7.1908

### Removed Platforms

- Raspbian 8.0
- Debian 9.2 / 9.3 / 9.4 / 9.5 / 9.6
- Fedora 26/27/28
- FreeBSD 10.4
- macOS 10.11 / 10.12
- openSUSE 42.2 / 42.3
- CentOS 6.8 / 7.3.1611 / 7.4.1708
- Debian 7.11
- FreeBSD 10.4
- Oracle Linux 6.8 / 7.3 / 7.4
- Redhat 6.8 / 7.3
- SUSE 11.4 / 12.1 / 12.2
- Ubuntu 17.10

### Newly Deprecated Platforms (removal in April 2021)

- AIX 6.1
- Amazon 2015.03 / 2015.09
- FreeBSD 11.1
- Redhat 6.9 / 7.4
- Windows 2008 R2
- Fedora 29

## v7.6 (2020-02-12)

### New / Updated Platforms

- FreeBSD 12.1

## v7.5.1 (2019-10-29)

- Fixed missing platform_family data for opensuse 15.0
- Deprecate Debian 7.11 platform data

## v7.5.0 (2019-10-08)

Note: fauxhai is now being pushed as the fauxhai-ng gem due to lack of access to the original rubygems namespace despite the access to the Github source of truth. The CLI and library namespaces will remain the same.

### New / Updated Platforms

- CentOS 7.7.1908
- CentOS 8
- Debian 9.11
- Fedora 30
- macOS 10.15
- SLES 12.4

### Newly Deprecated Platforms (removal in April 2021)

- Debian 7.11
- Fedora 26 / 27
- FreeBSD 10.4
- macOS 10.11
- openSUSE 42.2 / 42.3
- SLES 11.4, 12.1, 12.2
- Ubuntu 14.04

### Updated platforms

The following platforms we updated to Chef Infra Client 15.3, which adds additional package information for RHEL / SUSE based platforms

- Amazon Linux 2015 - 2.x
- CentOS 7.6.1810
- Debian 9.2 - 9.9
- Debian 10
- Fedora 28 / 29
- openSUSE 42.2 / 42.3
- Oracle Linux 6.10, 7.5, 7.6
- Redhat 6.8 - 6.10, 7.3 - 7.6
- SLES 11.4, 12.1 - 12.3, 15
- Ubuntu 16.04 / 18.04

## v7.4.0 (2019-07-10)

Note: Going forward we won't be shipping the point releases for each distro. Instead the major version will just be updated from time to time with the latest release. This means redhat 8 will be 8.0 then 8.1, then 8.2, etc. This will greatly reduce the size of this repo and the need to for users to update from deprecated definitions.

- Updated `suse` 15 from 15.0 to 15.1.
- Added a new `redhat` 8 definition to replace the 8.0 definition, which is now deprecated
- Updated all `amazon` and `ubuntu` releases to Chef 15.1
- Added an initial `debian` 10 dump. The debian project hasn't released an AMI yet so this is a VirtualBox dump

## v7.3.0 (2019-06-17)

- Updated many of the Amazon, Redhat, Debian, CentOS, Ubuntu, openSUSE, and SLES platforms to Chef 15.0.300

## v7.2.0 (2019-05-08)

### New / Updated Platforms

- Added RHEL 8.0

## v7.1.0 (2019-05-01)

### New / Updated Platforms

- Added openSUSE 15.0
- Added CentOS 6.10
- Added RHEL 6.10
- Added Debian 9.8 / 9.9
- Added Oracle Linux 6.10, 7.5, and 7.6
- Debian 9 releases updated to Chef 14.12
- Ubuntu releases updated to the latest point releases of 14.04, 16.04, and 18.04

### Newly Deprecated Platforms (removal in April 2020)

- Debian 9.2, 9.3, and 9.4
- Ubuntu 17.10
- CentOS 6.8, 7.3, 7.4
- Oracle Linux 6.8, 7.3, and 7.4
- RHEL 6.8, 7.3 and 7.4

## v7.0.0 (2018-01-30)

- Removed support for Ruby 2.2 as this Ruby release is now EOL
- Removed platform releases previously marked as deprecated:
  - Amazon Linux 2012.09, 2013.09, 2014.03, 2014.09, 2017.12 (2 beta)
  - CentOS 5.10, 6.7, 7.2.1511
  - ClearOS 7.0
  - Debian 7.10, 8.7, 8.8, 9.0, 9.1
  - Fedora 24, 25
  - FreeBSD 10.3, 11.0
  - Gentoo 4.9.6-gentoo-r1
  - ios_xr 6.0.0.14l
  - Linux Mint 18.1, 18.2
  - macOS 10.10
  - Nexus 5
  - OmniOS 151018
  - openSUSE 13.2, 42.1
  - Oracle Linux 5.10, 7.2
  - Solaris 5.10
  - Windows 7

For a list of currently support platform releases see https://github.com/chef/fauxhai/blob/master/PLATFORMS.md

## v6.11.0 (2018-01-30)

- Added Windows 2019 Server
- Added Red Hat Linux 7.6
- Added Debian 9.6
- Added CentOS 7.6.1804
- Updated Windows 2008 R2, 2012, 2012 R2, and 2016 from Chef 14.0 to Chef 14.10
- Updated Windows 7, 8.1, and 10 from 13.1 to 14.10
- Updated the fetcher logic to be compatible with ChefSpec 7.3+. Thanks [@oscar123mendoza](https://github.com/oscar123mendoza)
- Update Oracle Linux 6.8/7.2/7.3/7.4 to Ohai 14.8 in EC2
- Removed duplicate json data in gentoo 4.9.6

## v6.10.0 (2018-12-20)

- Updated the majority of dumps to Ohai 14.8
- Added Fedora 29
- Update examples in the readme to be rspec 3.X style

## v6.9.1 (2018-10-22)

- Remove extra 'etc' plugin data from several dumps
- Don't ship contributing and testing deps in the published gem to reduce gem size

## v6.9.0 (2018-10-20)

### New / Updated Platforms

- Linux Mint 18.3 updated to Chef 14.5
- Added Linux Mint 19

### Newly Deprecated Platforms

- Linux Mint 18.2
- Gentoo 4.9.6
- All versions of ios_xr
- All versions of omnios
- All versions of nexus

## v6.8.0 (2018-10-19)

### New Platforms

- Solaris 5.11 has been updated to the latest Solaris 11.4 release on Chef 14.5
- macOS 10.14
- SLES 15

### Newly Deprecated Platforms

- Solaris 5.10
- macOS 10.10

## v6.7.0 (2018-09-26)

### Regenerated on AWS

These systems were previously on Chef 13 / VirtualBox, but are now updated for Chef 14.5 on AWS

- Oracle 7.4
- Oracle 6.9

### Updated From Chef 14.3 -> Chef 14.5

- Amazon 2012.09
- Amazon 2013.09
- Amazon 2014.03
- Amazon 2014.09
- Amazon 2015.03
- Amazon 2015.09
- Amazon 2016.03
- Amazon 2016.09
- Amazon 2017.03
- Amazon 2017.09
- Amazon 2018.03
- CentOS 6.9
- CentOS 7.4
- Debian 8.7
- Debian 9.0
- Debian 9.1
- Debian 9.2
- Debian 9.4
- Debian 9.5
- Fedora 24
- Fedora 25
- Fedora 26
- Fedora 27
- Fedora 28
- openSUSE 42.2
- openSUSE 42.3
- Redhat 6.8
- Redhat 6.9
- Redhat 7.2
- Redhat 7.3
- Redhat 7.4
- Redhat 7.5
- SLES 11.4
- SLES 12.1
- SLES 12.2
- SLES 12.3
- Ubuntu 14.04
- Ubuntu 16.04
- Ubuntu 18.04

## v6.6.0 (2018-08-11)

### New Platforms

- Debian 9.5

### Regenerated on AWS

These systems were previously on Chef 13 on VirtualBox, but are now updated for Chef 14.3 on AWS

- Amazon 2012.09
- Amazon 2013.09
- Amazon 2014.03
- Amazon 2014.09
- Debian 8.7
- Debian 9.0
- Debian 9.1
- Debian 9.2
- Debian 9.3
- Redhat 7.2

### Updated From Chef 14.x -> Chef 14.3

- Amazon 2015.03
- Amazon 2015.09
- Amazon 2016.03
- Amazon 2016.09
- Amazon 2017.03
- Amazon 2017.09
- Amazon 2018.03
- CentOS 6.9
- CentOS 7.5
- CentOS 7.4
- Debian 9.4
- Fedora 24
- Fedora 25
- Fedora 26
- Fedora 27
- Fedora 28
- openBSD 6.2
- openSUSE 42.2
- openSUSE 42.3
- Redhat 6.8
- Redhat 6.9
- Redhat 7.3
- Redhat 7.4
- Redhat 7.5
- SLES 11.4
- SLES 12.2
- SLES 12.3
- SLES 12.4
- Ubuntu 14.04
- Ubuntu 16.04
- Ubuntu 18.04

## v6.5.0 (2018-07-16)

- Re-gathered the following operating systems on AWS with Chef 14.2

  - CentOS 6.9/7.4/7.5
  - Fedora 24-28
  - Debian 9.4

## v6.4.0 (2018-06-28)

### New Platforms

- CentOS 7.5
- Debian 8.11
- FreeBSD 11.2

### Dumps Updated for Chef 14.2

- Amazon Linux
- Redhat
- SLES
- Ubuntu

### New Deprecations

- FreeBSD 10.3

## v6.3.0 (2018-06-11)

New intelligent platform and version matching. This means if you specify the platform centos we'll now automatically match you to the latest version. If you specify the version of 6 we'll automatically match you to 6.9\. This should make it easier to write specs that don't need constant updating as we deprecate dumps of minor versions.

## v6.2.0 (2018-05-07)

### New Platforms

- Ubuntu 17.10
- Amazon 2018.03
- Amazon 2
- ClearOS 7.4
- Gentoo 4.9.95-gentoo
- Redhat 7.5
- Windows 2008R2
- Fedora 28

### Dumps Updated for Chef 14

- Amazon 2015.03 / 2015.09 / 2016.03 / 2016.09 / 2017.03
- openBSD 6.2
- Redhat 6.8 / 6.9 / 7.3 / 7.4
- SLES 11.4 / 12.1

### New Deprecations

- Amazon 2017.12 (replaced with Amazon 2)
- ClearOS 7.0
- Gentoo 4.9.6-gentoo-r1

## v6.1.0 (2018-04-09)

### New Deprecations

- Amazon Linux 2012.09, 2013.09, 2014.03, 2014.09
- Linux Mint 18.1
- Windows 2008R2
- Windows 7

### New Platforms

- Amazon Linux 2017.12 (Amazon Linux 2.0 preview)
- Linux Mint 18.2, 18.3
- Debian 9.4
- Ubuntu 18.04

### Dumps Updated for Chef 14

- AIX 7.1
- Amazon Linux 2017.09
- Debian 7.11, 8.10, 9.2, 9.3
- Fedora 26, 27
- FreeBSD 10.4, 11.1
- openSUSE 42.2, 42.3
- SLES 12.3
- Ubuntu 14.04, 16.04
- Windows 2008R2, 2012, 2012R2, 2016
- macOS 10.13

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