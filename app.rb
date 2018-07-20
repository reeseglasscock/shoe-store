require("bundler/setup")
Bundler.require(:default)
require("pry")

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get('/') do
  erb(:index)
end

get('/stores') do
  erb(:stores)
end

get('/admin') do
  @stores = Store.all
  erb(:admin)
end

post('/admin/stores/:id') do
  store = params.fetch("new_store")
  @store = Store.create({:store => store})
  @stores = Store.all
  redirect '/admin'
end
