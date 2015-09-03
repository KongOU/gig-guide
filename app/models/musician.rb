class Musician < ActiveRecord::Base
  belongs_to :origin
  belongs_to :user

  if Rails.env.development?
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: 'default.png'
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  else
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: 'default.png',
                      :storage => :dropbox,
                      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                      :path => ":style/:id_:filename"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  end
  validates :name, :genre, :origin, presence: true
  validates :description, presence: true, length: {minimum: 20}

  rails_admin do
    navigation_icon 'icon-music'
    label " Band"
    list do
      field :image
      field :name
      field :description
      field :genre
      field :origin
    end

    edit do
      field :name
      field :description
      field :genre
      field :origin
      field :image
    end
  end
end
