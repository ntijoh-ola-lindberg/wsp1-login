require 'sinatra'
require 'securerandom'

class App < Sinatra::Base

  def db
    return @db if @db
    @db = SQLite3::Database.new("db/loginexample.sqlite")
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

  get '/admin' do
    if session[:user_id]
      erb(:"admin/index")
    else
      redirect '/'
    end
  end

  get '/loginfailed' do
    erb(:loginfailed)
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
      redirect '/loginfailed'
    end

    db_id = user["id"].to_i
    db_password_hashed = user["password"].to_s

    # Create a BCrypt object from the hashed password from db
    bcrypt_db_password = BCrypt::Password.new(db_password_hashed)
    # Check if the plain password matches the hashed password from db
    if bcrypt_db_password.is_password?(request_plain_password)
      p "/login : Logged in -> redirecting to admin"
      session[:user_id] = db_id
      redirect '/admin'
    else
      p "/login : Invalid password."
      redirect '/loginfailed'
    end

  end

  get '/logout' do
    p "/logout : Logging out"
    session.clear
    redirect '/'
  end
end