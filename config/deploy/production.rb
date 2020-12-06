# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '3.114.25.219', user: 'ec2-user', roles: %w{app db web}
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/id_rsa_f1a17c336403e7811879af82aaf4f0b2'],
                  forward_agent: true