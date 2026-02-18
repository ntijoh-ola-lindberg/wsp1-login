require 'debug'
require "awesome_print"
require 'sinatra'
require 'securerandom'

class App < Sinatra::Base
    setup_development_features(self)

    def db
      return @db if @db
      @db = SQLite3::Database.new(DB_PATH)
      @db.results_as_hash = true

      return @db
    end

  configure do
    enable :sessions
    set :session_secret, SecureRandom.hex(64)
  end

  get '/' do
    if session[:user_id]
      erb(:"admin/index")
    else
      erb :index
    end
  end

  post '/testpwcreate' do
    plain_password = params[:plainpassword]
    password_hashed = BCrypt::Password.create(plain_password)
    p password_hashed
  end

  get '/admin' do
    if session[:user_id]
      erb(:"admin/index")
    else
      p "/admin : Access denied."
      status 401
      redirect '/unauthorized'
    end
  end

  get '/unauthorized' do
    erb(:unauthorized)
  end

  post '/login' do
    request_username = params[:username]
    request_plain_password = params[:password]

    user = db.execute("SELECT *
            FROM users
            WHERE username = ?",
            request_username).first

    unless user
      p "/login : Invalid username."
      status 401
      redirect '/unauthorized'
    end

    db_id = user["id"].to_i
    db_password_hashed = user["password"].to_s

    # Create a BCrypt object from the hashed password from db
    bcrypt_db_password = BCrypt::Password.new(db_password_hashed)
    # Check if the plain password matches the hashed password from db
    if bcrypt_db_password == request_plain_password
      p "/login : Logged in -> redirecting to admin"
      session[:user_id] = db_id
      redirect '/admin'
    else
      p "/login : Invalid password."
      status 401
      redirect '/unauthorized'
    end

  end

  get '/logout' do
    p "/logout : Logging out"
    session.clear
    redirect '/'
  end
end