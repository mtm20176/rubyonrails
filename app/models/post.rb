=begin

Copyright (C) Mark Milligan - All Rights Reserved
Unauthorized copying of this file, via any medium is strictly prohibited
Proprietary and confidential
Written by Mark Milligan <markmilligan@me.com>, 2019

=end

class Post < ApplicationRecord

  acts_as_votable


  validates :title, length: { minimum:15, :maximum => 255 }
  validates :text, length: { minimum:10, :maximum => 65536 }
  validates :product, length: { minimum:1, :maximum => 255 }

  scope :user, -> { joins("INNER JOIN users ON posts.user_id = users.id") }


  # method to convert data to CSV delimited format
  def self.to_csv
    CSV.generate(force_quotes: true) do |csv|
      #csv << column_names
      all.each do |postrow|
        csv << postrow.attributes.values_at(*["cached_votes_total","product","email","created_at","title","text"])
      end
    end
  end


end
