require 'spec_helper'

describe User do
	it 'needs a password and confirmation to save' do
		u = User.new(name: "stevie")

		u.save
		expect(u).to_not be_valid

		u.password = "password"
		u.password_confirmation = ""
		u.save
		expect(u).to_not be_valid

		u.password_confirmation = "password"
		u.save
		expect(u).to be_valid
	end

	it "needs password and password_confirmation to match" do
		u = User.create(
				name: "stevie",
				password: "wonder",
				password_confirmation: "wonder2")
		expect(u).to_not be_valid
	end
end

describe "authentication" do
	let(:user) { User.create(
		name: "stevie",
		password: "wonder",
		password_confirmation: "wonder") }

	it "authenticates with a correct password" do
		expect(user.authenticate("wonder")).to be
	end

	it "does not authenticates with an incorrect password" do
		expect(user.authenticate("wonder1")).to_not be
	end
end
