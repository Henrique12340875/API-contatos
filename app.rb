require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'dotenv'

Dotenv.load

class MainApp < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    set :database,{adapter:"sqlite3", database:"./db/development.sqlite3"}
    set :port,ENV["PORT"]

    get "/users/:id" do

    end
    
    get "/users" do
    
    end
    
    post "/users" do
    
    end
    
    put "/users/:id" do
    
    end
    
    delete "/users/:id" do
    
    end
end

