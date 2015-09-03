class Event < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search,
                  against: %i(
                    title
                    location
                    genre
                    venue
                  ),
                  using: {
                    tsearch: {
                      dictionary: 'english',
                      any_word: true,
                      prefix: true
                    }
                  }
  belongs_to :origin
  belongs_to :user
  scope :khmer, -> { where(origin_id: 1).order('created_at DESC') }
  scope :western, -> { where(origin_id: 2).order('created_at DESC') }
  scope :current_event, -> { where('start_on BETWEEN ? AND ?', Date.current.beginning_of_day, Date.current.end_of_day).order(created_at: :DESC).limit(9) }
  scope :yesterday_event, -> { where('start_on BETWEEN ? AND ?', Date.yesterday.beginning_of_day, Date.yesterday.end_of_day).order(created_at: :DESC).limit(9) }

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
  validates :title, :genre, :venue, :location, :origin, presence: true
  validates :description, presence: true, length: {minimum: 50}

  rails_admin do
    navigation_icon 'icon-calendar'
    label " Gigs"
    list do
      field :image
      field :title
      field :description
      field :start_on
      field :genre
      field :venue
      field :location
      field :origin
    end

    edit do
      field :title
      field :description
      field :start_on
      field :genre
      field :venue
      field :location
      field :origin
      field :image
    end
  end
end
