# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Photo < ApplicationRecord
  validates(:poster, { :presence => true })
  belongs_to(:poster,class_name:"User",foreign_key:"owner_id")
  has_many(:likes)
  has_many(:comments)
  has_many(:fans,through: :likes,source: :fan)
  # Association accessor methods to define:
  
   
  ## Indirect associations

  # Photo#fans: returns rows from the users table associated to this photo through its likes
end
