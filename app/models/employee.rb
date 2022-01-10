class Employee < ApplicationRecord
  belongs_to :department
  has_one_attached :photo

  def thumbnail
    return self.photo.variant(resize: '90x90!').processed
  end
end
