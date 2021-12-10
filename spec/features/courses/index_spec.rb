require 'rails_helper'
describe 'Courses index page' do
  before do
    @student1 = Student.create!(name:"Harry", age: 13, house: "Gryffindor")
    @student2 = Student.create!(name:"Draco", age: 14, house: "Slytherin")
    @herbology = Course.create!(name:"Herbology")
    @defense = Course.create!(name:"Defense")
    @transfiguration = Course.create!(name:"Transfiguration")
    @student1_defense = StudentCourse.create!(student: @student1, course: @defense)
    @student1_transfiguration = StudentCourse.create!(student: @student1, course: @transfiguration)
    @student2_defense = StudentCourse.create!(student: @student2, course: @defense)
    @student2_transfiguration = StudentCourse.create!(student: @student2, course: @transfiguration)
    @student2_herbology= StudentCourse.create!(student: @student2, course: @herbology)
  end

  it 'I see a list of courses and the number of students enrolled in each course.' do
    visit '/courses'
    expect(page).to have_content("Herbology has 1 students enrolled")
    expect(page).to have_content("Defense has 2 students enrolled")
    expect(page).to have_content("Transfiguration has 2 students enrolled")
  end
end
