require './app/models/user'

describe User do
  it 'creates a new user' do
    user = User.create(
      :forename => 'Joe',
      :surname => 'Bloggs',
      :email => 'noddy@hotmail.com',
      :username => 'JoeBloggs',
      :password => 'password123',
      :password_confirmation => 'password123'
    )
    expect(user).to be_a User
    expect(user.username).to eq 'JoeBloggs'
    expect(user.email).to eq 'noddy@hotmail.com'
    expect(user.forename).to eq 'Joe'
  end

  it 'authenticates a user log in' do
    user = User.create(
      :forename => 'Joe',
      :surname => 'Bloggs',
      :email => 'noddy@hotmail.com',
      :username => 'JoeBloggs',
      :password => 'password123',
      :password_confirmation => 'password123'
    )
    authenticated_user = User.authenticate(username: 'JoeBloggs', password: 'password123')
    expect(authenticated_user.id).to eq user.id
  end

  it 'does not authenticate a incorrect user log in' do
    user = User.create(
      :forename => 'Joe',
      :surname => 'Bloggs',
      :email => 'noddy@hotmail.com',
      :username => 'JoeBloggs',
      :password => 'password123',
      :password_confirmation => 'password123'
    )
    expect(User.authenticate(username: 'FalseUser', password: 'password123')).to be_nil
  end
end
