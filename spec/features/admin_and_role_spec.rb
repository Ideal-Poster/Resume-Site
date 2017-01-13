require 'rails_helper'

def log_in_as(admin)
  visit new_admin_session_path
  fill_in("admin_email", with: admin.email)
  fill_in("admin_password", with: admin.password)
  click_button("Log in")
end

def log_out
  click_on("sign_out")
end

def create_project
  visit new_project_path
  fill_in("project_title_form", with: "Projecto")
  fill_in("project_description_form", with: "This is a project")
  click_button "create project"
end

describe "with and without admin role" do

  let(:admin) { Admin.create!(email: "test@example.com", password: "password") }
  let(:project) { FactoryGirl.create(:project, title: "Hello", description: "this is something") }

  describe "Project" do
    describe "Create Page" do
      it 'allows a logged-in admin to view the projects create page' do
        log_in_as(admin)
        visit(new_project_path)
        expect(current_path).to eq(new_project_path)
      end

      it 'does not allow user to see the project create page if not logged in' do
        log_in_as(admin)
        create_project
        log_out
        visit(edit_project_path(1))
        expect(current_path).to eq(admin_session_path)
      end
    end

    describe "Edit Page" do
      it 'allows a logged-in admin to view the projects edit page' do
        log_in_as(admin)
        create_project
        visit(edit_project_path(1))
        expect(current_path).to eq(edit_project_path(1))
      end

      it 'does not allow user to see the project edit page if not logged in' do
        log_in_as(admin)
        create_project
        log_out
        visit(edit_project_path(1))
        expect(current_path).to eq(admin_session_path)
      end
    end

    describe 'Show Page' do
      it 'allows a user to view a project page' do
        log_in_as(admin)
        create_project
        log_out
        visit project_path(1)
        expect(current_path).to eq(project_path(1))
      end

      it 'allows logged-in admin to view a project page' do
        log_in_as(admin)
        create_project
        visit project_path(1)
        expect(current_path).to eq(project_path(1))
      end
    end

    describe 'Index Page' do
      it 'allows a user to view project index page' do
        visit projects_path
        expect(current_path).to eq(projects_path)
      end

      it 'allows logged in admin to view project index page' do
        log_in_as(admin)
        visit projects_path
        expect(current_path).to eq(projects_path)
      end
    end
  end

end
