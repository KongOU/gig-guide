class Event < ActiveRecord::Base
  belongs_to :origin
  has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :khmer, -> { where(origin_id: 1).order('created_at DESC') }
  scope :western, -> { where(origin_id: 2).order('created_at DESC') }
end
