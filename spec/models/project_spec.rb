require 'rails_helper'

RSpec.describe Project, type: :model do
  let (:project) {
    FactoryGirl.create(:project,
      title: "Anything",
      description: "Lorem ipsum dolor sit amet",
      note: "some notes"
    )
  }

  it "is valid with valid attributes" do
    expect(project).to be_valid
  end

  it "is not valid without a title" do
    project.title = nil
    expect(project).to_not be_valid
  end

  it "is not valid without a description" do
    project.description = nil
    expect(project).to_not be_valid
  end

  it "is valid with or without a note" do
    note = project
    project.note = nil
    no_note = project
    (expect(note).to be_valid) && (expect(no_note).to be_valid)
  end

end
