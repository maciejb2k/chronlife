Rails.logger.debug "Seeding random users ..."

100.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = "#{first_name}#{last_name}".downcase

  user = User.new(
    email: "#{first_name}.#{last_name}@gmail.com",
    password: "password",
    password_confirmation: "password",
    tos_agreement: true
  )
  user.skip_confirmation!
  user.save!

  account = user.build_account(
    first_name:,
    last_name:,
    username:,
    is_hidden: [true, false].sample
  )
  account.save!

  predefined_disease_ids = []

  def get_random_unused_predefined_disease(used_ids)
    unused_diseases = PredefinedDisease.where.not(id: used_ids)
    unused_diseases.sample
  end

  5.times do
    predefined_disease = get_random_unused_predefined_disease(predefined_disease_ids)
    next unless predefined_disease

    Disease.create!(
      account:,
      predefined_disease:,
      diagnosed_at: Date.new(2023, 5, 15),
      diagnosed_by_hp: false,
      severity: rand(1..5),
      color: "#FF0000"
    )

    Group.where(predefined_disease:).first.accounts << account

    predefined_disease_ids.push(predefined_disease.id)
  end
end

Rails.logger.debug "Seeding random users completed."
