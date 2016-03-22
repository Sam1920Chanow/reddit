class Channel < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5}
  has_many :posts, dependent: :destroy
end
