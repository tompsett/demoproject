class pupapply::access {

    group { $pupapply::group:
        ensure => present
    }

    user { $pupapply::user:
        ensure => present,
        gid => $pupapply::group,
        managehome => true,
        require => Group[$pupapply::group]
    }

}

