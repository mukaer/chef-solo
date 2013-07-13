default['publify']['user']       = "deploy"
default['publify']['group']      = "www"
default['publify']['rack_user']  = "unicorn"

default['publify']['git_repository']  = "https://github.com/fdv/publify.git"
default['publify']['git_revison']     = "master"
default['publify']['chmod_dirs']     =  ["/tmp",
                                         "/log",
                                         "/config",
                                         "/public",
                                         "/public/javascripts",
                                         "/public/javascripts/ckeditor",
                                         "/public/stylesheets",
                                         "/public/uploads",
                                         "/public/files"
                                        ]


default['publify']['db_adpter']       = "mysql2"
default['publify']['db_host']         = "localhost"
default['publify']['db_username']     = "root"
default['publify']['db_password']     = ""
default['publify']['db_encoding']     = "utf8"
default['publify']['db_dev']          = "publify_dev"
default['publify']['db_test']         = "publify_tests"
default['publify']['db_pro']          = "publify"

default['publify']['conf_uc_overwrite']   = true
default['publify']['uc_worker_processes'] = "2"
default['publify']['uc_port']             = "3000"

default['publify']['gemfile_overwrite']   = true

default['publify']['rails_env']       = ""
