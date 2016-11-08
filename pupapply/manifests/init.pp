# == Class: pupapply
#
# Full description of class pupapply here.
#
# === Parameters
#
# Document parameters here.
#
# [*user*]
#   Local user to install & run rails app. Type: String
#   Default: rorusr
#
# [*group*]
#   Local group to install & run rails app. Type: String
#   Default: rorgrp
#
# [*version*]
#   Version of app to deploy.  Type: String
#   Default: master
#
# === Variables
#
# NA
#
# === Examples
#
#  class { 'pupapply':
#    user => 'appuser',
#    group => 'appgrp',
#    version => 'master'
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class pupapply ( $version = 'master',
                 $port = 'tbi',     
                 $user = 'rorusr',
                 $group = 'rorgrp' ) {

    # Pull in some defaults (could be sourced from elsewhere)
    include pupapply::params

    # Install default app user and software packages
    include pupapply::access
    include pupapply::software
    include pupapply::config

}
