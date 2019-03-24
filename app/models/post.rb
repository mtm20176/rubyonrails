class Post < ApplicationRecord


  validates :title, length: { minimum:15, :maximum => 255 }
  validates :text, length: { minimum:10, :maximum => 65536 }


  scope :user, -> { joins("INNER JOIN users ON posts.user_id = users.id") }


  # method to convert data to CSV delimited format
  def self.to_csv
    CSV.generate(force_quotes: true) do |csv|
      #csv << column_names
      all.each do |postrow|
        csv << postrow.attributes.values_at(*["title","text","email","created_at"])
      end
    end
  end


end
