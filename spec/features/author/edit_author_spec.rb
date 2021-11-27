describe "Edit Author Page", type:  :feature do
    it "should exist" do
        FactoryBot.create :author
        visit edit_author_path(1)
    end
end