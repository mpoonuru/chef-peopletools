peopletools Cookbook CHANGELOG
==========================

1.1.0 (2016-05-05)
------------------
- Added tnsnames resource.

1.0.1 (2016-04-08)
------------------
- Modified guard for tuxedo to avoid install order issues with weblogic.

1.0.0 (2016-04-08)
------------------
- Renamed ps_apphome resource to ps_app_home to match Oracle references.

0.3.4 (2016-04-07)
------------------
- Removed setting of password for users; tidied up system recipe/attributes.

0.3.3 (2016-04-06)
------------------
- Renamed default oracle user from oracle2 to oracle.

0.3.2 (2016-04-05)
------------------
- Moved sysctl attributes from attributes file to system recipe to prevent issues with wrapper cookbooks.

0.3.1 (2016-03-03)
------------------
- Updated deploy user/group for ps_apphome to match Oracle default.

0.3.0 (2016-03-03)
------------------
- Added attribute to allow ps_apphome archive_repo to be different from the peopletools archive_repo and updated Readme.

0.2.0 (2016-03-03)
------------------
- Added limits attributes and configuration for psft_runtime and psft_app_install groups.

0.1.3 (2016-03-01)
------------------
- Changed deployment resources property from archive_file to archive_url.

0.1.2 (2016-03-01)
------------------
- Added cookbook property to template resources to prevent wrapper cookbook issues.

0.1.1 (2016-02-29)
------------------
- Fixed RuboCop offenses; updated Readme.

0.1.0 (2016-02-29)
------------------
- Initial release of peopletools.
