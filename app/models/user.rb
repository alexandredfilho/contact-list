class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  after_commit :add_default_photo, on: %i[create update]

  def photo_thumbnail
    if photo.attached?
      photo.variant(resize: '90x90!').processed
    else
      "avatar.jpg"
    end
  end

  private

  def add_default_photo
    unless photo.attached?
      photo.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'avatar.jpg'
          )
        ),
        filename: 'avatar.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
