describe "Show Author Page", type:  :feature do
    it "should show alans page" do
        visit author_path(@alan)
        expect(page).to have_text('')
    end
end