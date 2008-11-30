#!/usr/bin/env bash

### installation

sudo gem install merb webrat



### app generation

cd ~/Projects/
merb-gen app house
cd house



### create controllers, models, migrations

merb-gen resource Product
merb-gen migration CreateProducts
# edit migration



### prepare database

rake db:database_yaml
# edit config/database.yml
rake db:migrate



### run the server

merb -p 4000
# navigate to http://localhost:4000/
