FactoryGirl.define do
	factory :user do
		name "steve"
		email 'example@example.com'
		password 'password'
		password_confirmation 'password'
	end
end