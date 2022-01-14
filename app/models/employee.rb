class Employee < ApplicationRecord
  belongs_to :department
  has_one_attached :photo

  def thumbnail
    return self.photo.variant(resize: '90x90!').processed
  end

  enum roles: {
    Employee: 0,
    Coordinator: 1,
    Supervisor: 2,
    Manager: 3
  }

  scope :employee,    -> { where(roles: 'Employee') }
  scope :coordinator, -> { where(roles: 'Coordinator') }
  scope :supervisor,  -> { where(roles: 'Supervisor') }
  scope :manager,     -> { where(roles: 'Manager') }
end
