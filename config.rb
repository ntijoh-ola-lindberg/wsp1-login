require 'fileutils'
require 'sqlite3'

ENV['RACK_ENV'] ||= 'development'

DB_NAME   = 'sqlite.db'
DB_FOLDER = 'db'
DB_PATH   = File.expand_path(File.join(__dir__, DB_FOLDER, DB_NAME))

FileUtils.mkdir_p(File.dirname(DB_PATH))

# Hjälpmetod för att sätta upp reload
def setup_development_features(app_class)
  if ENV['RACK_ENV'] == 'development'
    require 'sinatra/reloader'
    app_class.register Sinatra::Reloader
    
    if Dir.exist?(File.join(__dir__, 'models'))
      app_class.also_reload File.join(__dir__, 'models', '*.rb')
    end

    app_class.also_reload File.join(__dir__, 'config.rb')
    puts "♻️  Auto-reload aktiv (inklusive views och models)"
  end
end