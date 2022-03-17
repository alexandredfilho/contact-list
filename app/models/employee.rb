class Employee < ApplicationRecord
  belongs_to :department
  has_one_attached :photo
  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee", optional: true
  after_commit :default_photo, on: %i[create update]

  def photo_thumbnail
    photo = self.photo
    if photo.attached?
      photo.variant(resize: "90x90!").processed
    else
      image_tag ("avatar.jpg"), size:"90"
    end
  end

  def manager_photo
    manager = self.manager
    if manager.present? && manager.photo.attached?
      manager.photo.variant(resize: '90x90!').processed
    else
      "avatar.jpg"
    end
  end

  enum roles: {
    employee: 0,
    coordinator: 1,
    supervisor: 2,
    manager: 3
  }

  paginates_per 3

  private

  def default_photo
    unless self.photo.attached?
      self.photo.attach(
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
