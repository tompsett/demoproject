class pupapply::software {

    package { $pupapply::params::packages :
        ensure => present
    }

    # slight hack to get nodejs from epel quickly without breaking other deps
    package { 'nodejs':
        ensure => latest,
        install_options => ['--enablerepo=epel']
    }

    # Load the bundler gem (assume only one ruby install
    package { 'bundler':
        ensure => latest,
        provider => 'gem'
    }

    # Push the app out from files resource, ideally would put artifact somewhere(s3,...) and grab based on version/param
    file { "/home/${pupapply::user}/webapp-${pupapply::version}":
        source => "puppet:///modules/pupapply/webapp-demo-$pupapply::version",
        owner => $pupapply::user,
        group => $pupapply::group,
        ensure => directory,
        replace => true,
        #purge => true,
        recurse => true,
        require => User[$pupapply::user],
        notify => Exec ['bundle_install']
    }

}

