require 'rails_helper'

describe User, type: :model do
  it 'should successfully save a new user if all required fields are present' do
    user = User.create(fname: 'Abe', lname: 'Lincoln', email: 'abc@abc.com', password: 'abcdefg')
    expect(user.persisted?).to be(true)
  end

  describe 'Fields missing when registering' do
    it 'should fail to create if first name is missing' do
      user = User.create(fname: nil, lname: 'Lincoln', email: 'abc@abc.com', password: 'abcdefg')
      expect(user.persisted?).to be(false)
    end
    it 'should fail to create if last name is missing' do
      user = User.create(fname: 'Abe', lname: nil, email: 'abc@abc.com', password: 'abcdefg')
      expect(user.persisted?).to be(false)
    end
    it 'should fail to create if email is missing' do
      user = User.create(fname: 'Abe', lname: 'Lincoln', email: nil, password: 'abcdefg')
      expect(user.persisted?).to be(false)
    end
    it 'should fail to create if password is missing' do
      user = User.create(fname: 'Abe', lname: 'Lincoln', email: 'abc@abc.com', password: nil)
      expect(user.persisted?).to be(false)
    end
  end

  describe 'Emails' do
    it 'should fail if an email already exists' do
      user = User.create(fname: 'Abe', lname: 'Lincoln', email: 'abc@abc.com', password: 'abcdefg')
      user2 = User.create(fname: 'Beth', lname: 'Marner', email: 'abc@abc.com', password: 'abcdefg')
      expect(user2.persisted?).to be(false)
    end
    it 'should fail if an email already exists in a different case' do
      user = User.create(fname: 'Abe', lname: 'Lincoln', email: 'abc@abc.com', password: 'abcdefg')
      user2 = User.create(fname: 'Beth', lname: 'Marner', email: 'ABC@abc.com', password: 'abcdefg')
      expect(user2.persisted?).to be(false)
    end
    it 'should fail if email is not entered in the right format' do
      user = User.create(fname: 'Abe', lname: 'Lincoln', email: 'this.is.an.email@notreally', password: 'abcdefg')
      expect(user.persisted?).to be(false)
    end
    it 'should fail if email is not entered in the right format (2)' do
      user = User.create(fname: 'Abe', lname: 'Lincoln', email: 'hahahathisis.totally.an.email', password: 'abcdefg')
      expect(user.persisted?).to be(false)
    end
  end

  describe 'Passwords' do
    it 'should fail if passwords do not match' do
      user = User.create(fname: 'Abe', lname: 'Lincoln', email: 'abc@abc.com', password: 'abcdefg', password_confirmation: 'abcdef')
      expect(user.persisted?).to be(false)
    end
    it 'should fail if passwords are entered with incorrect cases' do
      user = User.create(fname: 'Abe', lname: 'Lincoln', email: 'abc@abc.com', password: 'abcdefg', password_confirmation: 'Abcdefg')
      expect(user.persisted?).to be(false)
    end
    it 'should succeed if passwords do match' do
      user = User.create(fname: 'Abe', lname: 'Lincoln', email: 'abc@abc.com', password: 'abcdefg', password_confirmation: 'abcdefg')
      expect(user.persisted?).to be(true)
    end
    it 'should fail if password is shorter than 5 characters' do
      user = User.create(fname: 'Abe', lname: 'Lincoln', email: 'abc@abc.com', password: 'abcd', password_confirmation: 'abcd')
      expect(user.persisted?).to be(false)
    end
  end

  describe 'Logging in' do
    pending
  end
end
