class Employee < ApplicationRecord
  belongs_to :department
  has_one_attached :photo
  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee", optional: true

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
