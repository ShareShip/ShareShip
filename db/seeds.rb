# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

User.create(email: 'admin@example.com', password: 'password', address: '123 test st, toronto, ON, L4L 2L5')

50.times do
	Vendor.create(name: Faker::Company.unique.name)
end	

vendors = Vendor.all.pluck(:id)

50.times do 
  f = Faker::Address
  address = f.street_address + ' street, ' + f.city + ', ' + f.state_abbr + ' ' + f.zip
  u = User.create!(
	      email: Faker::Internet.unique.email,
	      password: Faker::Internet.password(6, 20),
	      address: address,
	      city: f.city
	  )

  r = rand(3) # 1 in 3 chance of user having an order listing

  if r == 0
  	rand(1..2).times do  ## that user will have 1..2 products
	  	v_id = vendors.sample
	  	c = Faker::Commerce
	  	p = Order.create!(
		  		user_id: u.id,
		  		vendor_id: v_id,
		  		name: c.product_name,
		  		price: c.price,
		  		quantity: rand(1..10),
		  		date: Time.now,
		  		city: u.city)

	  	vendors.delete(v_id)
	  end
  end

end


  users = User.all.pluck(:id)

Order.all.sample(20) do |o|
	from_id = users.sample
	to_id = (users - [from_id]).sample
	Payment.create(
		from_id: from_id,
		to_id: to_id,
		price: o.price,
		quantity: o.quantity,
		fee: )


end




