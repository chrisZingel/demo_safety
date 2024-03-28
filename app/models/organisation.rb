class Organisation < ApplicationRecord
  has_many :users,  dependent: :destroy
  has_many :videos,  dependent: :destroy

  validate :creator_is_admin
  validates :name,presence: true

  def has_admin_role?
    users.inject(false){|k,e| e.role == "admin" ? true: k}
  end

  accepts_nested_attributes_for :users

  def creator_is_admin
    errors.add(:base, :creator_is_not_admin, message: "creator needs to be admin") unless has_admin_role?
  end
end
