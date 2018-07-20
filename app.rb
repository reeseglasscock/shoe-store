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
  erb(:admin)
end

get('/admin/stores') do
  @stores = Store.all
  @brands = Brand.all
  erb(:edit_stores)
end

get('/admin/brands') do
  @stores = Store.all
  @brands = Brand.all
  erb(:add_brands)
end

post('/admin/stores/:id') do
  @stores = Store.all
  store = params.fetch("new_store")
  @store = Store.create({:store => store})
  redirect '/admin/stores'
end

patch('/admin/stores/:id') do
  @stores = Store.all
  store_id = params.fetch("shoe_store").to_i
  update_store = params.fetch("new_store_name")
  @store = Store.find(store_id)
  @store.update(store: update_store)
  redirect '/admin/stores'
end

delete('/admin/stores/:id') do
  @stores = Store.all
  @store = Store.find(params.fetch("shoe_store").to_i)
  @store.destroy
  redirect '/admin/stores'
end

post('/admin/brands/:id') do
  @brands = Brand.all
  shoe_brand = params.fetch("new_brand")
  shoe_brand_price = params.fetch("new_brand_price")
  @shoe_brand = Brand.create({:shoe_brand => shoe_brand, :price => shoe_brand_price})
  redirect '/admin/stores'
end

post('/admin/stores/brands/:id') do
  store = Store.find(params.fetch("select_a_store").to_i)
  brands = Brand.find(params.fetch("select_a_brand"))
  binding.pry
  store.brands.push(brands)
  binding.pry
  redirect '/admin/brands'
end
