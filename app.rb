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
  @stores = Store.all
  store = params.fetch("new_store")
  @store = Store.create({:store => store})
  redirect '/admin'
end

patch('/admin/stores/:id') do
  @stores = Store.all
  store_id = params.fetch("shoe_store").to_i
  update_store = params.fetch("new_store_name")
  @store = Store.find(store_id)
  @store.update(store: update_store)
  redirect '/admin'
end

delete('/admin/stores/:id') do
  @stores = Store.all
  @store = Store.find(params.fetch("shoe_store").to_i)
  @store.destroy
  redirect '/admin'
end
