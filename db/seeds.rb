puts 'Seeding - START'

Favorite.destroy_all
Contact.destroy_all
Property.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('favorites')
ActiveRecord::Base.connection.reset_pk_sequence!('contacts')
ActiveRecord::Base.connection.reset_pk_sequence!('properties')
ActiveRecord::Base.connection.reset_pk_sequence!('users')

puts 'Seeding users'

User.create(name: 'Landlord Di Prueba', email: 'landlord@mail.com', phone: '987654321', password: 'qwerty',
            password_confirmation: 'qwerty', role: 'landlord')
User.create(name: 'Landlord Di Prueba 2', email: 'landlord2@mail.com', phone: '987654321', password: 'qwerty',
            password_confirmation: 'qwerty', role: 'landlord')
User.create(name: 'Landlord Di Prueba 3', email: 'landlord3@mail.com', phone: '987654321', password: 'qwerty',
            password_confirmation: 'qwerty', role: 'landlord')
User.create(name: 'Seeker Di Prueba', email: 'seeker@mail.com', phone: '987654789', password: 'qwerty',
            password_confirmation: 'qwerty', role: 'seeker')
User.create(name: 'Seeker Di Prueba 2', email: 'seeker2@mail.com', phone: '987654789', password: 'qwerty',
  password_confirmation: 'qwerty', role: 'seeker')

operation_types = %w[rent sale]
property_types = %w[house apartment]
bedrooms_options = [1, 2, 3, 4, 5]
bathrooms_options = [1, 2, 3, 4, 5]
area_options = [50, 80, 100, 120, 150]
pets_allowed_options = [true, false]
closed_options = [true, false]
about_info = 'This is a beautiful property located in a quiet and safe area.'
user_id = [1, 2, 3]

puts 'Seeding properties'

data_images = ['db/assets/images/image1.webp', 'db/assets/images/image2.webp', 'db/assets/images/image3.webp',
               'db/assets/images/image4.webp', 'db/assets/images/image5.webp', 'db/assets/images/image6.webp',
               'db/assets/images/image7.webp', 'db/assets/images/image8.webp', 'db/assets/images/image9.webp',
               'db/assets/images/image10.webp', 'db/assets/images/image11.webp', 'db/assets/images/image12.webp']

property_data = 30.times.map do |index|
  {
    operation_type: operation_types.sample,
    address: "Avenida Agustin Gamarra 10#{index + 1}",
    city: 'Huaraz',
    country: 'Perú',
    price: rand(100_000..500_000),
    monthly_rent: rand(500..2000),
    maintenance: rand(50..200),
    property_type: property_types.sample,
    bedrooms: bedrooms_options.sample,
    bathrooms: bathrooms_options.sample,
    area: area_options.sample,
    pets_allowed: pets_allowed_options.sample,
    about: about_info,
    closed: closed_options.sample,
    user_id: user_id.sample
  }
end

property_data.each do |data|
  property = Property.create(data)
  4.times do
    property.images.attach(io: File.open(data_images.sample), filename: "fake_photo#{rand(1..1000)}.webp")
  end
end

puts 'Seeding favorites'

Favorite.create(user_id: 4, property_id: 1)
Favorite.create(user_id: 4, property_id: 3)

puts 'Seeding contacts'

Contact.create(user_id: 4, property_id: 1)
Contact.create(user_id: 4, property_id: 5)
Contact.create(user_id: 5, property_id: 5)

puts 'End seed'
