require 'sqlite3'
require_relative '../config'
require 'bcrypt'

class Seeder

  def self.seed!

    @db = nil

    puts "Using db file: #{DB_PATH}"
    puts "🧹 Dropping old tables..."
    drop_tables
    puts "🧱 Creating tables..."
    create_tables
    puts "🍎 Populating tables..."
    populate_tables
    puts "✅ Done seeding the database!"
  end

  private

  def self.db
    @db ||= begin
      db = SQLite3::Database.new(DB_PATH)
      db.results_as_hash = true
      db
    end
  end

  def self.drop_tables
    db.execute('DROP TABLE IF EXISTS users')
  end

  def self.create_tables
    db.execute('CREATE TABLE users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT NOT NULL,
                password TEXT NOT NULL)')
  end

  def self.populate_tables
    password_hashed = BCrypt::Password.create("123")
    p "Storing hashed version of password to db. Clear text never saved. #{password_hashed}"
    db.execute('INSERT INTO users (username, password) VALUES (?, ?)', ["ola", password_hashed])
  end

end
