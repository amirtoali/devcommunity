10.times do |i|
	user = User.create(
     first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     username:" #{Faker::Name.first_name}_#{i+10}",
     email:Faker::Internet.email,
     password: "amir1234",
     contect_number: Faker::PhoneNumber.phone_number_with_country_code,
     streat_adress: Faker::Address.street_address,
     city: Faker::Address.city, 
     state: Faker::Address.state,
     country: Faker::Address.country,
     pincode: Faker::Address.postcode,
     data_of_birth: (Date.today +rand(1..30).days)-rand(20..36).years, 
     perfile_title: User::PROFILE_TITLE.sample
		)
	byebug
end