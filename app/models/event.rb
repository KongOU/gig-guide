class Event < ActiveRecord::Base
  belongs_to :origin
  # Search
  searchkick
  scope :khmer, -> { where(origin_id: 1).order('created_at DESC') }
  scope :western, -> { where(origin_id: 2).order('created_at DESC') }
  scope :current_event, -> { where('start_on BETWEEN ? AND ?', Date.current.beginning_of_day, Date.current.end_of_day).order(start_on: :DESC).limit(20) }

  if Rails.env.development?
    has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: 'default.png'
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  else
    has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: 'default.png',
                      :storage => :dropbox,
                      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                      :path => ":style/:id_:filename"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  end
end
