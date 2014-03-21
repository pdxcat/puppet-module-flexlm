Flexlm Puppet module
====================

[![Build Status](https://travis-ci.org/pdxcat/puppet-module-flexlm.svg)](https://travis-ci.org/pdxcat/puppet-module-flexlm)

Description
-----------

Puppet module for managing flexlm services

Usage
-----

```puppet
  flexlm::service { 'mentor':
    binary_path  => '/usr/local/sbin/lmgrd-11.10.0.0',
    license_path => '/pkgs/license/vendor/mentor/licenses/license.dat';
  }
```
