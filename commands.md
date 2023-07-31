rails new . --api -d postgresql --skip-test

rails g model User name phone email:string:uniq role:integer properties_count:integer password_digest:string:uniq token:token
--modify migration: t.integer :properties_count, default: 0

rails g model Property operation_type:integer address city country price:integer monthly_rent:integer maintenance:integer property_type:integer bedrooms:integer bathrooms:integer area:integer pets_allowed:boolean about:text close:boolean favorites_count:integer contacts_count:integer user:references

rails g model Favorite user:references property:references

rails g model Contact user:references property:references

rails active_storage:install

rails g controller users show create update

rails g controller properties index show create update destroy

rails g controller favorites index show create destroy

rails g controller contacts index show create destroy

rails g migration AddIndexUserPropertyToFavorite

rails g migration AddIndexUserPropertyToContact
