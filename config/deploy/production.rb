server 'tl', roles: %w[app db web]

set :ssh_options, {
  user: 'deploy',
  keys: [
    '~/.ssh/digitalocean_treelogger_id_rsa',
    '~/.ssh/id_rsa_treelogger_deploy_key'
  ],
  forward_agent: true,
  auth_methods: ['publickey']
}

set :database_password, ENV['TREELOGGER_DATABASE_PASSWORD']
