class Video < ApplicationRecord
  validates :description, presence: true
  include VideoUploader::Attachment(:file) # adds an `image` virtual attribute
  belongs_to :organisation
  has_many :categories,  dependent: :destroy
end
