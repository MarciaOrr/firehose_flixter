class Course < ActiveRecord::Base
  belongs_to :user
  has_many :sections, dependent: :destroy
  has_many :enrollments, dependent: :destroy

  validates :title, presence: true,
                    length: { maximum: 60, minimum:3 }
  validates :description, presence: true
  validates :cost, presence: true,
                   numericality: {greater_than_or_equal_to: 0}

  def free?
    cost.zero?
  end

  def premium?
    !free?
  end

  mount_uploader :image, ImageUploader
end
