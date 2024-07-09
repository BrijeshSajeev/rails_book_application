# lib/tasks/migrate_carrierwave_to_active_storage.rake
namespace :migrate do
  desc "Migrate CarrierWave uploads to Active Storage"
  task carrierwave_to_active_storage: :environment do
    require 'open-uri'
    
    # User.find_each do |user|
    #   if user.image.present?
    #     begin
    #       file = URI.open(user.image.url)
    #       # puts file
    #       user.image_new.attach(io: file, filename: File.basename(user.image.url))
    #       puts "Migrated image for user ##{user.id}"
    #     rescue => e
    #       puts "Failed to migrate image for user ##{user.id}: #{e.message}"
    #     end
    #   end
    # end

    Book.find_each do |book|
      if book.image.present?
        begin
          file = URI.open(book.image.url)
          book.image_new.attach(io: file, filename: File.basename(book.image.url))
          
          puts "Migrated image for book ##{book.id}"
        rescue => e
          puts "Failed to migrate image for book ##{book.id}: #{e.message}"
        end
      end
    end

  end
end
