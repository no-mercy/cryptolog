### Installation

1. Install ruby
2. Install bundler
`gem install bundler`
3. Install dependencies
`bundle install`

### Running

1. Edit config/settings.yml
2. Execute
`./cryptolog.rb`
or run
`ruby cryptolog.rb`

### Other

You can use systemd `cryptolog.service` unit file from `systemd` folder

1. Copy `systemd/cryptolog.service` into `/etc/systemd/system`
2. Update it with used paths
3. Reload systemd configs `systemctl daemon-reload`
4. Run it `systemctl start cryptolog`
5. To start it on boot run `systemctl enable cryptolog`
