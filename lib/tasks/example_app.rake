# frozen_string_literal: true

namespace :example_app do
  desc "Update the database schema"
  task update: :environment do
    db = ActiveRecord::Base.connection
    if db.table_exists?("schema_migrations") &&
       db.select_all("select * from schema_migrations").any?
      puts "Database schema is already loaded. Running migrations with db:migrate"
      Rake::Task["db:migrate"].invoke
    else
      puts "No schema migrations exist. Loading schema with db:schema:load"
      Rake::Task["db:schema:load"].invoke
    end
    puts "Done"
  end
end
