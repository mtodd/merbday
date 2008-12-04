### config/router.rb

resources :products
match('/').to(:controller => 'products', :action =>'index')



### schema/migrations/001_create_products_migration.rb

migration 1, :create_products  do
  up do
    create_table :products do
      column :id,         Integer, :serial => true
      column :name,       String
      column :sku,        String
      column :aisle,      String
      column :bin,        String
      column :inventory,  Integer
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
  down do
    drop_table :products
  end
end



### config/database.yml

development: &defaults
  
  adapter:  sqlite3
  database: schema/development.db

test:
  <<:       *defaults
  database: schema/test.db

production:
  <<:       *defaults
  database: schema/production.db

rake:
  <<: *defaults



### app/models/product.rb

class Product
  include DataMapper::Resource
  
  ### Properties
  
  property :id,         Integer, :serial => true
  property :name,       String
  property :sku,        String
  property :aisle,      String
  property :bin,        String
  property :inventory,  Integer
  property :created_at, DateTime
  property :updated_at, DateTime
  
end



### app/controllers/products.rb SAMPLE

class Products < Application
  
  def index
    @products = Product.all(:order => [:inventory.desc])
    display @products
  end
  
end
