class Employee < ApplicationRecord
  belongs_to :department
  has_one_attached :photo
  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee", optional: true
  after_commit :default_photo, on: %i[create update]

  def self.todays_birthdays
    Employee.where("strftime('%m%d', date_of_birth) = ?", Date.today.strftime('%m%d'))
  end

  def self.upcoming_birthdays
    return true
    #Employee.where(date_of_birth: Date.today..14.days.from_now)
    # Employee.where("extract(month from date_of_birth) = ? AND extract(day from date_of_birth) = ?", Date.today.strftime('%m'), Date.today.strftime('%d'))

    # Employee.where("
    #    date_of_birth + INTERVAL '1 year' * (DATE_PART('year', CURRENT_DATE)::integer - DATE_PART('year', date_of_birth)::integer) BETWEEN :start_date AND :end_date
    #  ", start_date: Date.today, end_date: 14.days.from_now)
  end

  def photo_thumbnail
    photo = self.photo
    if photo.attached?
      photo.variant(resize: "90x90!").processed
    else
      "avatar.jpg"
    end
  end

  def photo_thumbnail_upcoming_birthdays
    photo = self.photo
    if photo.attached?
      photo.variant(resize: "50x50!").processed
    else
      "avatar.jpg"
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
