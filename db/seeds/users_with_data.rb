user = User.new(
  email: "tomasz.nowak@gmail.com",
  password: "password",
  password_confirmation: "password"
)
user.skip_confirmation!
user.save!

account = user.build_account(
  first_name: "Tomasz",
  last_name: "Nowak",
  username: "tomasznowak"
)
account.save!
