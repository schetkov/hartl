require 'rails_helper'

describe "User" do

  let(:user) { FactoryGirl.create(:user) }

  subject { user }

  describe "Responders: " do
    it "Should respond to NAME attribute" do
      expect(user).to respond_to(:name)
    end

    it "Should respond to EMAIL attribute" do
      expect(user).to respond_to(:email)
    end

    it "Should respond to PASSWORD_DIGEST" do
      expect(user).to respond_to(:password_digest)
    end

    it "Should be valid with NAME and EMAIL attributes" do
     expect(user).to be_valid
    end

    it "Should respond to PASSWORD attribute" do
      expect(user).to respond_to(:password)
    end

    it "Should respond to PASSWORD_CONFIRMATION attribute" do
      expect(user).to respond_to(:password_confirmation)
    end

    it "Should respond to AUTHENTICATE method" do
      expect(user).to respond_to(:authenticate)
    end
  end

  describe "Validators: " do
    it "Password should be eq to password_confirmation" do
      expect(user.password).to eq user.password_confirmation
    end

    it "Should not be valid when there is no password" do
      user.password = user.password_confirmation = " "
      expect(user).to_not be_valid
    end

    it "Should not be valid with short password" do
      user.password = user.password_confirmation = "1234567"
      expect(user).to_not be_valid
    end

    it "Should not be valid without name" do
      user_without_name = user.dup
      user_without_name.name = nil
      user_without_name.save
      expect(user_without_name).to_not be_valid
    end

    it "Should not be valid with duplicate email address" do
      user_with_same_email = user.dup
      expect(user_with_same_email.save).to be_falsey
    end
  end
end
