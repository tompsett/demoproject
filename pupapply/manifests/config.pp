class pupapply::config {

    # Subscribe to the file resource
    exec { 'bundle_install':
        command => 'bundle install',
        user => $pupapply::user,
        environment => "HOME=/home/${pupapply::user}",
        cwd => "/home/${pupapply::user}/webapp-${pupapply::version}",
        path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin",
        refreshonly => true,
        notify => Exec['rake_db_migrate'],
        require => File["/home/${pupapply::user}/webapp-${pupapply::version}"]
    }

    exec { 'rake_db_migrate':
        command => 'bin/rake db:migrate RAILS_ENV=development',
        user => $pupapply::user,
        environment => "HOME=/home/${pupapply::user}",
        logoutput => true,
        cwd => "/home/${pupapply::user}/webapp-${pupapply::version}",
        refreshonly => true,
        path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/${pupapply::user}/webapp-${pupapply::version}"
    } 

    exec { 'bundle_execrailsserver':
        command => 'nohup bundle exec rails server &',
        user => $pupapply::user,
        environment => "HOME=/home/${pupapply::user}",
        cwd => "/home/${pupapply::user}/webapp-${pupapply::version}",
        path => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin",
        require => Exec['rake_db_migrate'],
        unless => "pgrep -f '/usr/bin/ruby2.0 bin/rails server'"
    }

}

