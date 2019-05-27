fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios increment_version_patch
```
fastlane ios increment_version_patch
```
Increments version patch number, new patch. E.g. 1.0.2->1.0.3
### ios increment_version_minor
```
fastlane ios increment_version_minor
```
Increments version minor number, new patch. E.g. 1.8.2->1.9.0
### ios bump_build
```
fastlane ios bump_build
```
Increments build number

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
