class Employee < ApplicationRecord
  belongs_to :department
  has_one_attached :photo
  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee", optional: true
  after_commit :default_photo, on: %i[create update]

  def self.todays_birthdays
    coming_up(:date_of_birth)
  end

  def self.upcoming_birthdays
    coming_up(:date_of_birth, days: 14)
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

  def self.coming_up(date_field, days: 0)
    date_in_current_year = <<~SQL
      make_date(
        EXTRACT(YEAR FROM CURRENT_DATE) :: int,
        EXTRACT(MONTH FROM #{date_field}) :: int,
        EXTRACT(DAY FROM #{date_field}) :: int
      )
    SQL

    ::Employee
      .where(id: Employee.ids)
      .select(:id)
      .select("#{date_in_current_year} AS #{date_field}")
      .select(:first_name)
      .select(:last_name)
      .select(:title)
      .select("(EXTRACT(YEAR from CURRENT_DATE) - EXTRACT(YEAR from #{date_field})) :: int AS will_be")
      .where("#{date_in_current_year} BETWEEN CURRENT_DATE AND (CURRENT_DATE + '#{days} days' :: interval)")
      .where("(EXTRACT(YEAR from CURRENT_DATE) - EXTRACT(YEAR from #{date_field})) :: int BETWEEN 1 AND 150")
  end
end
