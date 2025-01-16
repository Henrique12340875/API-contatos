require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'dotenv'
require_relative 'models/Users'

Dotenv.load

set :database,{adapter:"sqlite3", database:"./db/development.sqlite3"}

set :port, ENV.fetch("PORT", 3000)

get "/users/:id" do
    begin
        user = User.find(params['id'])
        user.to_json
    rescue ActiveRecord::RecordNotFound => e
        {
            erro: e.message
        }.to_json
    end
end
        
get "/users" do
    users = User.all

    users.to_json
end
        
post "/users" do
    begin
        body = JSON.parse(request.body.read) 
        user = User.create(name:body['name'],email:body['email'],password:body['password']) 
        user.to_json 
    rescue ActiveRecord::RecordNotSaved => e
        {
            erro: e.message
        }.to_json
    end
end
        
put "/users/:id" do
    begin
        id = params['id']
        body = JSON.parse(request.body.read)
        user = User.find(id)
        user.update(name:body['name'],email:body['email'],password:body['password'])
        user.to_json
    rescue ActiveRecord::RecordNotSaved => e
        {
            erro: e.message
        }.to_json
    end
end
        
delete "/users/:id" do
    begin
        user = User.find(params['id'])
        user.destroy

        user.to_json
    rescue ActiveRecord::RecordNotDestroyed => e
        {
            erro: e.message
        }.to_json
    end    
end




