class Comment < ActiveRecord::Base
  belongs_to :posting
  validates_presence_of :body
end
