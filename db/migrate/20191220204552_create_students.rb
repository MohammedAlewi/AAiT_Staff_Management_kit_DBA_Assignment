class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :full_name
      t.string :id_num
      t.string :sex
      t.string :department
      t.string :compus
      t.string :dob

      t.timestamps
    end
  end
end
