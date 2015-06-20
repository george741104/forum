class Comment < ActiveRecord::Base
  validates_presence_of :topic

  belongs_to :user
  belongs_to :post

end
