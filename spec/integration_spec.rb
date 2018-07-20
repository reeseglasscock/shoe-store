require('spec_helper')

describe('start at home page', {:type => :feature}) do
  it "will open the home page" do
    visit ('/index')
    expect(page).to have_content('Welcome to the store')
  end
end
