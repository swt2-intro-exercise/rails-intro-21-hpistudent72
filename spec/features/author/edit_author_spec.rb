describe "Edit Author Page", type:  :feature do
    it "should exist" do
        FactoryBot.create :author
        visit edit_author_path(1)
    end

    it "should be able to change First Name without error" do
        FactoryBot.create :author
        visit edit_author_path(1)
        page.fill_in 'author[first_name]', with: 'Bob'
        find('input[type="submit"]').click
    end
end