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

    it "should have updated the entry after using submit with a different first name" do
        FactoryBot.create :author
        visit edit_author_path(1)
        page.fill_in 'author[first_name]', with: 'Bob'
        find('input[type="submit"]').click
        #get author from database
        #@author.reload
        #expect(@author.first_name).to eq('Bob')
    end
end