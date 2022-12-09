# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User.create!(email: "alan@test.com", password: "test", password_confirmation: "test", fname: "Alan", lname: "M")



#TODO: Create Existing Faculty

# user = User.new(email: "facultytestselt2022@gmail.com", password: "password1234", password_confirmation: "password1234", fname: "James", lname: "Ben", phone: "515-555-5555")
# user.build_faculty(university: "University of Iowa")
# user.save


# user = User.new(email: "facultytest2selt2022@test.com", password: "password1234", password_confirmation: "password1234", fname: "Brad", lname: "Clark", phone: "515-555-5555")
# user.build_faculty(university: "University of Iowa")
# user.save


#
# #TODO: Create new Student Users
# user1 = User.new(email: "jimselt2022@test.com", password: "password1234", password_confirmation: "password1234", fname: "Jim", lname: "Smith", phone: "515-555-5555")
# user2 = User.new(email: "sallyselt2022@test.com", password: "password1234", password_confirmation: "password1234", fname: "Sally", lname: "Anderson", phone: "515-555-5555")
# user3 = User.new(email: "benselt2022@test.com", password: "password1234", password_confirmation: "password1234", fname: "Ben", lname: "Barnes", phone: "515-555-5555")
#
# user1.build_student(address: "123 N St", gender: "Male", citizenship: "United States")
# user2.build_student(address: "345 S St", gender: "Female", citizenship: "United States")
# user3.build_student(address: "542 W St", gender: "Male", citizenship: "United States")
#
# # Save after the seed runs
# if user1.valid? then user1.save end
# if user2.valid? then user2.save end
# if user3.valid? then user3.save end
#
# #TODO: Create new Degrees for the Students
# deg1_james = Degree.new(name: "University of Northern Iowa", city: "Cedar Falls, IA", degree_type: "Associates", major: "Computer Science", gpa: "3.12")
# deg2_james = Degree.new(name: "Iowa State University", city: "Ames, IA", degree_type: "Bachelors", major: "Computer Science", gpa: "3.42")
# deg3_james = Degree.new(name: "Iowa State University", city: "Ames, IA", degree_type: "Masters", major: "Computer Engineering", gpa: "3.31")
#
# deg1_sally = Degree.new(name: "Iowa State University", city: "Ames, IA", degree_type: "Bachelors", major: "Computer Science", gpa: "3.56")
# deg2_sally = Degree.new(name: "University of Iowa", city: "Iowa City, IA", degree_type: "Masters", major: "Computer Science", gpa: "3.49")
#
# deg1_ben = Degree.new(name: "University of Texas", city: "Austin, TX", degree_type: "Bachelors", major: "Business Analytics", gpa: "3.02")
#
#
# user1.student.degrees << deg1_james
# user1.student.degrees << deg2_james
# user1.student.degrees << deg3_james
# user2.student.degrees << deg1_sally
# user2.student.degrees << deg2_sally
# user3.student.degrees << deg1_ben
#
# # save if no problems with seeding
# if deg1_james.valid? then deg1_james.save end
# if deg2_james.valid? then deg2_james.save end
# if deg3_james.valid? then deg3_james.save end
# if deg1_sally.valid? then deg1_sally.save end
# if deg2_sally.valid? then deg2_sally.save end
# if deg1_ben.valid? then deg1_ben.save end
#
#
# #TODO: Create applications for each Student
# grad_app_james = GradApplication.new(university: "University of Iowa", date: "2022-12-01", research_area: "Artificial Intelligence",
#                                     deg_obj: "PhD", deg_obj_major: "Computer Engineering",
#                                     statement_of_purpose: "This is the place I want to go. I am a hardworking student.")
#
# grad_app_sally = GradApplication.new(university: "University of Iowa", date: "2022-12-05", research_area: "Machine Learning",
#                                      deg_obj: "PhD", deg_obj_major: "Electrical Engineering.",
#                                      statement_of_purpose: "I am very smart and I love Iowa please pick me.")
#
# grad_app_ben = GradApplication.new(university: "University of Iowa", date: "2022-09-04", research_area: "Data Analytics",
#                                      deg_obj: "Masters", deg_obj_major: "Computer Science",
#                                      statement_of_purpose: "This is the place I want to go. I love Iowa.")
#
# user1.student.grad_applications << grad_app_james
# user2.student.grad_applications << grad_app_sally
# user3.student.grad_applications << grad_app_ben
#
#
# if grad_app_james.valid? then grad_app_james.save end
# if grad_app_sally.valid? then grad_app_sally.save end
# if grad_app_ben.valid? then grad_app_ben.save end
#



#TODO: Recommendation letter stuff

# recommend1_james = LetterOfRecommendation.new(email: "connorjim@test.com", letter: "Pick this candidate. He is a good one.")
# recommend2_james = LetterOfRecommendation.new(email: "samjim@test.com", letter: "Pick this smart candidate. He is a smart one.")
# recommend3_james = LetterOfRecommendation.new(email: "mariatim@test.com", letter: "He is not so smart for grad school.")
#
# recommend1_sally = LetterOfRecommendation.new(email: "mariatim@test.com", letter: "He is not so smart for grad school.")
# recommend2_sally = LetterOfRecommendation.new(email: "samjim@test.com", letter: "Pick this smart candidate. He is a smart one.")
# recommend3_sally = LetterOfRecommendation.new(email: "connorjim@test.com", letter: "Pick this candidate. He is a good one.")
#
# recommend1_ben = LetterOfRecommendation.new(email: "connorjim@test.com", letter: "Pick this candidate. He is a good one.")
# recommend2_ben = LetterOfRecommendation.new(email: "mariatim@test.com", letter: "He is not so smart for grad school.")
# recommend3_ben = LetterOfRecommendation.new(email: "samjim@test.com", letter: "Pick this smart candidate. He is a smart one.")
#
# grad_app_james = GradApplication.find_by_statement_of_purpose("This is the place I want to go. I am a hardworking student.")
# grad_app_sally = GradApplication.find_by_statement_of_purpose("I am very smart and I love Iowa please pick me.")
# grad_app_ben = GradApplication.find_by_statement_of_purpose("This is the place I want to go. I love Iowa.")
#
# grad_app_james.letter_of_recommendations << recommend1_james
# grad_app_james.letter_of_recommendations << recommend2_james
# grad_app_james.letter_of_recommendations << recommend3_james
#
# grad_app_sally.letter_of_recommendations << recommend1_sally
# grad_app_sally.letter_of_recommendations << recommend2_sally
# grad_app_sally.letter_of_recommendations << recommend3_sally
#
# grad_app_ben.letter_of_recommendations << recommend1_ben
# grad_app_ben.letter_of_recommendations << recommend2_ben
# grad_app_ben.letter_of_recommendations << recommend3_ben
#
#
#
#
#
# if recommend1_james.valid? then recommend1_james.save else puts "un valid james" end
# if recommend2_james.valid? then recommend2_james.save else puts "un valid james" end
# if recommend3_james.valid? then recommend3_james.save else puts "un valid james" end
# if recommend1_sally.valid? then recommend1_sally.save else puts "un valid sally" end
# if recommend2_sally.valid? then recommend2_sally.save else puts "un valid sally" end
# if recommend3_sally.valid? then recommend3_sally.save else puts "un valid sally" end
# if recommend1_ben.valid? then recommend1_ben.save else puts "un valid ben" end
# if recommend2_ben.valid? then recommend2_ben.save else puts "un valid ben" end
# if recommend3_ben.valid? then recommend3_ben.save else puts "un valid ben" end
#
#
# grad_app_james.save
# grad_app_sally.save
# grad_app_ben.save

