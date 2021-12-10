require 'rails_helper'
describe 'Students index page' do
  before do
    @student1 = Student.create!(name:"Harry", age: 13, house: "Gryffindor")
    @student2 = Student.create!(name:"Draco", age: 14, house: "Slytherin")
    @herbology = @student1.courses.create!(name:"Herbology")
    @defense = @student1.courses.create!(name:"Defense")
    @transfiguration = @student2.courses.create!(name:"Transfiguration")

  end
  it 'I see a list of the students courses' do
    visit "/students/#{@student1.id}"
    expect(page).to have_content(@herbology.name)
    expect(page).to have_content(@defense.name)
    expect(page).to_not have_content(@transfiguration.name)
    visit "/students/#{@student2.id}"
    expect(page).to have_content(@transfiguration.name)
    expect(page).to_not have_content(@herbology.name)
    expect(page).to_not have_content(@defense.name)
  end
end
