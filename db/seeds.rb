# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

User.create(email: 'admin@example.com', password: 'password')

50.times do
	Vendor.create(name: Faker::Company.unique.name)
end	

vendors = Vendor.all.pluck(:id)

50.times do 
  u = User.create!(
	      email: Faker::Internet.unique.email,
	      password: Faker::Internet.password(6, 20),
	      address_line_1: Faker::Address.street_address,
	      city: Faker::Address.city,
	      state: Faker::Address.state_abbr,
	      zip: Faker::Address.zip,
	      phone: Faker::PhoneNumber.phone_number
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
		  		shipping: rand(8..12).to_s + ".0",
		  		quantity: rand(1..10),
		  		date: Time.now,
		  		city: u.city)

	  	vendors.delete(v_id)
	  end
  end

end


  users = User.all.pluck(:id)

Order.all.each do |o|
	if rand(3) == 0
		from_id = users.sample
		to_id = (users - [from_id]).sample
		Payment.create!(
			from_id: from_id,
			to_id: to_id,
			order_id: o.id,
			price: o.price,
			quantity: o.quantity,
			fee: sprintf("%.2f", o.shipping.to_f * 0.6) )
	end
end




