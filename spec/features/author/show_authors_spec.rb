describe "Show Author Page", type:  :feature do
    it "should show alans page" do
        FactoryBot.create :author
        visit author_path(1)
        expect(page).to have_text('First Name')
    end
end