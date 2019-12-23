class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :couse_code
      t.string :course_description
      t.integer :credit_hour
      t.integer :ects

      t.timestamps
    end
  end
end
