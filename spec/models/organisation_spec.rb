require 'rails_helper'

RSpec.describe Organisation, type: :model do

  describe "with valid  user params" do
    let(:valid_params) { { name: "default name", description: "description name", users_attributes: [role: "admin", email: "admin@safetyhub", password: "password", password_confirmation: "password"] } }
    it "is  valid " do
      expect(Organisation.new(valid_params)).to be_valid
    end
  end

  describe "with organisation params" do
    let(:valid_params) { { name: "default name", description: "description name", users_attributes: [role: "admin", email: "admin@safetyhub", password: "password", password_confirmation: "password"] } }
    it "is  invalid without a organisation title" do
      valid_params[:name] = ""
      expect(Organisation.new(valid_params)).to_not be_valid
    end
  end

  describe "without user params" do
    let(:valid_params) { { name: "default name", description: "description name" } }
    it "is  invalid" do
      expect(Organisation.new(valid_params)).to_not be_valid
    end
  end
end
