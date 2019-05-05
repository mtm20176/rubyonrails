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

      csv << ["Votes","Product","Post_Status","Created_At","Post_Title","Post_Text","Post_Resolution"]
      all.each do |postrow|

        if postrow.anonymous
          email = "Anonymous"
        else
          email = postrow.email.split("@").first
        end

        created_at = postrow.created_at.strftime('%Y-%m-%d %H:%M:%S')

        csv << [postrow.cached_votes_total, postrow.product, postrow.status, created_at, email, postrow.title, postrow.text, postrow.notes]        


        #csv << postrow.attributes.values_at(*["cached_votes_total","product","status","created_at","title","text","notes"])
      
      end
    end
  end


end
