class Musician < ActiveRecord::Base
  belongs_to :origin
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
end
