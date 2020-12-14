# frozen_string_literal: true

require "rails_helper"

describe User, type: :model do
  it "Happy path: should successfully save a new user if all required fields are present" do
    user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "abcdefg",
                                  is_guest: false)
    expect(user.persisted?).to be(true)
  end

  describe "Registration (is_guest = false)" do
    it "fails to create if name is missing" do
      user = described_class.create(name: nil, given_name: "Abe", email: "abc@abc.com", password: "abcdefg",
                                    is_guest: false)
      expect(user.persisted?).to be(false)
    end

    it "works if given name is missing" do
      user = described_class.create(name: "Abe", given_name: nil, email: "abc@abc.com", password: "abcdefg",
                                    is_guest: false)
      expect(user.persisted?).to be(true)
    end

    it "fails to create if email is missing" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: nil, password: "abcdefg",
                                    is_guest: false)
      expect(user.persisted?).to be(false)
    end

    it "fails to create if password is missing" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: nil,
                                    is_guest: false)
      expect(user.persisted?).to be(false)
    end
  end

  describe "Guest accounts" do
    it "fails to create if email is missing" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: nil, password: "abcdefg",
                                    is_guest: true)
      expect(user.persisted?).to be(false)
    end

    it "fails to create if a password is entered (only registered users should have passwords)" do
      user = described_class.create(name: nil, given_name: nil, email: "abc@abc.com", password: "abcdefg",
                                    is_guest: true)
      expect(user.persisted?).to be(false)
    end

    it "creates even if all fields other than email are missing" do
      user = described_class.create(name: nil, given_name: nil, email: "abc@abc.com", password: nil, is_guest: true)
      expect(user.persisted?).to be(true)
    end
  end

  describe "Emails" do
    it "fails if an email already exists" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "abcdefg",
                                    is_guest: false)
      user2 = described_class.create(name: "Elizabeth Childs", given_name: "Beth", email: "abc@abc.com", password: "abcdefg",
                                     is_guest: false)
      expect(user2.persisted?).to be(false)
    end

    it "fails if an email already exists in a different case" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "abcdefg",
                                    is_guest: false)
      user2 = described_class.new(name: "Elizabeth Childs", given_name: "Beth", email: "ABC@abc.com", password: "abcdefg",
                                  is_guest: false)
      puts "Email is: #{user2.email}"
      puts "After adjusting it's: #{user2.email.strip.downcase}"
      user2.save
      expect(user2.persisted?).to be(false)
    end

    it "fails if email is not entered in the right format" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "this.is.an.email.notreally",
                                    password: "abcdefg", is_guest: false)
      expect(user.persisted?).to be(false)
    end
  end

  describe "Passwords" do
    it "fails if passwords do not match" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "abcdefg",
                                    password_confirmation: "abcdef", is_guest: false)
      expect(user.persisted?).to be(false)
    end

    it "fails if passwords are entered with incorrect cases" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "abcdefg",
                                    password_confirmation: "Abcdefg", is_guest: false)
      expect(user.persisted?).to be(false)
    end

    it "succeeds if passwords do match" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "abcdefg",
                                    password_confirmation: "abcdefg", is_guest: false)
      expect(user.persisted?).to be(true)
    end

    it "fails if password is shorter than 5 characters" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "abcd",
                                    password_confirmation: "abcd", is_guest: false)
      expect(user.persisted?).to be(false)
    end

    it "passes if password is 5 or more characters" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "abcde",
                                    password_confirmation: "abcde", is_guest: false)
      expect(user.persisted?).to be(true)
    end
  end

  describe "Logging in authenticate_with_email method" do
    it "logs in if a valid username/password combination is entered" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "abcdefg",
                                    is_guest: false)
      expect(described_class.authenticate_with_email("abc@abc.com", "abcdefg")).to be_truthy
    end

    it "email should not be case sensitive" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "abcdefg",
                                    is_guest: false)
      expect(described_class.authenticate_with_email("ABC@abc.com", "abcdefg")).to be_truthy
    end

    it "email should strip whitespace" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "abcdefg",
                                    is_guest: false)
      expect(described_class.authenticate_with_email(" abc@abc.com  ", "abcdefg")).to be_truthy
    end

    it "password should be case sensitive" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: "Abcdefg",
                                    is_guest: false)
      expect(described_class.authenticate_with_email(" abc@abc.com  ", "abcdefg")).to be_nil
    end

    it "password should not strip extra spaces" do
      user = described_class.create(name: "Abraham Lincoln", given_name: "Abe", email: "abc@abc.com", password: " abcdefg",
                                    is_guest: false)
      expect(described_class.authenticate_with_email(" abc@abc.com  ", "abcdefg")).to be_nil
    end
  end
end
