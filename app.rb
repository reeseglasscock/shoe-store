require("bundler/setup")
Bundler.require(:default)
require("pry")
require './environments'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get('/') do
  @stores = Store.all
  erb(:index)
end

get('/stores') do
  @stores = Store.all
  erb(:stores)
end

get('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i)
  erb(:store_info)
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
  if @stores.empty?
    redirect '/admin/stores'
  else
    store_id = params.fetch("shoe_store").to_i
    update_store = params.fetch("new_store_name")
    @store = Store.find(store_id)
    @store.update(store: update_store)
    redirect '/admin/stores'
  end
end

delete('/admin/stores/:id') do
  @stores = Store.all
  if @stores.empty?
    redirect '/admin/stores'
  else
    @store = Store.find(params.fetch("shoe_store").to_i)
    @store.destroy
    redirect '/admin/stores'
  end
end

post('/admin/brands/:id') do
  @brands = Brand.all
  shoe_brand = params.fetch("new_brand")
  shoe_brand_price = params.fetch("new_brand_price")
  @shoe_brand = Brand.create({:shoe_brand => shoe_brand, :price => shoe_brand_price})
  redirect '/admin/stores'
end

post('/admin/stores/brands/:id') do
  if Store.count == 0
    redirect '/admin/brands'
  else
    store = Store.find(params.fetch("select_a_store").to_i)
    brands = Brand.find(params.fetch("select_a_brand"))
    store.brands.push(brands)
    redirect '/admin/brands'
  end

end
