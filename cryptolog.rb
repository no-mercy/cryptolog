#!/usr/bin/env ruby
require_relative './lib/initializer'

Rack::Handler::WEBrick.run(
      Cryptolog.freeze.app,
      Host: Settings.interface,
      Port: Settings.port
)
