namespace :db do
  namespace :test do
    desc "Load the test seed data from db/seeds.rb"
    task load: :environment do
      Rake::Task["db:seed"].invoke
    end
  end
end
