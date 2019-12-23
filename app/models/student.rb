class Student < ApplicationRecord
    has_many:enrollments
    has_many:courses, through: :enrollments
    validates :full_name,presence:true
    validates :id_num,presence:true
    validates :sex,presence:true
    validates :department,presence:true
    validates :compus,presence:true
    validates :dob,presence:true
    validates :id_num,uniqueness:true
end
