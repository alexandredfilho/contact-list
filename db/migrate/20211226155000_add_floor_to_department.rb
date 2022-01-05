class AddFloorToDepartment < ActiveRecord::Migration[6.1]
  def change
    add_reference :departments, :floor, null: false, foreign_key: true
  end
end
