require 'rack'
require 'roda'
require 'config'
Config.load_and_set_settings(Config.setting_files(File.expand_path('.', 'config'), :production))
Dir['./lib/*.rb'].each{|f| require f}
Dir['./lib/parsers/*.rb'].each{|f| require f}
