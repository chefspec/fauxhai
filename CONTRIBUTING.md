# Contributing to Fauxhai

Fauxhai is community-maintained and updated. Aside from the initial files, all of the ohai system mocks have been created by the community. If you have a system that you think would benefit the community, here's how you get it into [fauxhai](https://github.com/chefspec/fauxhai):

1. Build a system to your liking (on a virtual machine, for example)
2. Install chef, ohai, and fauxhai
3. Run the following at the command line:

  Unix:

  ```
   sudo fauxhai > /tmp/fauxhai.json
  ```

  Windows (in Administrator mode):

  ```
   fauxhai > C:\SomePath\fauxhai.json
  ```

4. This will create a file `fauxhai.json` at the specified path. As with any tool, inspect the contents of the file before continuing

5. Copy the contents of this file to your local development machine (using scp or sftp, for example)
6. Fork, clone and `bundle`:

  ```
   git clone https://github.com/<your username>/fauxhai.git
   cd fauxhai
   bundle
  ```

7. Create a new branch named `add_[platform]_[version]` (e.g. `add_ubuntu_12_04`) without dashes and dots replaced with underscores. Be sure to use the official version number, not a package name (e.g. '12_04', not 'precise') if available:

  ```
   Ubuntu Precise, 12.04       add_ubuntu_12_04
   Ubuntu Lucid, 10.04         add_ubuntu_10_04
   OSX Lion, 10.7.4            add_osx_10_7_4
   Windows XP                  add_windows_xp
  ```

  **Q:** Is there a reason for this super-specific naming convention?

  **A:** No, but it helps in tracking problems and analyzing pull requests. Ultimately it just ensures your pull request is merged as quickly as possible

8. Create a new json file in `lib/fauxhai/platforms/[os]/[version].json` (e.g. `lib/fauxhai/platforms/ubuntu/12.04.json`)

9. Copy-paste the contents of the file from `Step 4` into this file and save
10. Verify the installation was successful by doing the following:

  ```
  bundle console
  requiure "fauxhai"
  Fauxhai.mock(platform: '[os]', version: '[version]') # e.g. Fauxhai.mock(platform: 'ubuntu', version: '12.04').data
  ```

  As long as that does not throw an error, you're good to go!

11. Submit a pull request on github

**Note:** I do _not_ need to release a new version of Fauxhai for your changes to be pulled and used. Unless you are updating an existing platform, Fauxhai will automatically pull new versions from GitHub via HTTP and cache them.
