require_relative('../models/student')

Student.delete_all

student1 = Student.new({'first_name'=> 'Harry', 'last_name' => 'Potter', 'house' => 'Gryffindor', 'age' => 14})
student1.save()

student1 = Student.new({'first_name'=> 'Arry', 'last_name' => 'Otter', 'house' => 'Hufflepuff', 'age' => 14})
student1.save()

student1 = Student.new({'first_name'=> 'Dracko', 'last_name' => 'Malfoy', 'house' => 'Slythirin', 'age' => 15})
student1.save()
