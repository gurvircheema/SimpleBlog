class Posting < ActiveRecord::Base
  validates :name, presence: true
  validates :blogpost, presence: true
  
  has_many :comments, dependent: :destroy, autosave: true
end
