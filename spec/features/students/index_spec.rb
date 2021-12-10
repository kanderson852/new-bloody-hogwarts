require 'rails_helper'
describe 'Students index page' do
  before do
    @student1 = Student.create!(name:"Harry", age: 13, house: "Gryffindor")
    @student2 = Student.create!(name:"Draco", age: 14, house: "Slytherin")

    visit '/students'
  end
  it 'I see a list of students with the following information:' do
    within "#student-#{@student1.id}" do
      expect(page).to have_content(@student1.name)
      expect(page).to have_content(@student1.age)
      expect(page).to have_content(@student1.house)
    end
    within "#student-#{@student2.id}" do
      expect(page).to have_content(@student2.name)
      expect(page).to have_content(@student2.age)
      expect(page).to have_content(@student2.house)
    end
  end

  it 'has average age across students' do
    expect(page).to have_content(13.5)
    save_and_open_page
  end

  end
