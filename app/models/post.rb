class Post < ActiveRecord::Base
  belongs_to :channel
  has_many :comments
  belongs_to :user
end
