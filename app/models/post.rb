class Post < ActiveRecord::Base
  validates_presence_of :topic

  belongs_to :user
  belongs_to :category
  has_many :comments, :dependent => :destroy
end
