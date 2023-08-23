puts "Seeding ..."

# Order is important
load Rails.root.join("db", "seeds", "roles.rb")
load Rails.root.join("db", "seeds", "predefined_diseases.rb")
load Rails.root.join("db", "seeds", "predefined_symptomps.rb")
load Rails.root.join("db", "seeds", "units.rb")
load Rails.root.join("db", "seeds", "measurement_types.rb")
load Rails.root.join("db", "seeds", "article_tags.rb")

# Seeds for local development
if Rails.env.development?
  load Rails.root.join("db", "seeds", "users_with_data.rb")
  load Rails.root.join("db", "seeds", "random_users.rb")
end

puts "Seeding done."
