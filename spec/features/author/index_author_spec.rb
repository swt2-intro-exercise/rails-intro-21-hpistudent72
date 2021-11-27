describe "Index Author Page", type:  :feature do
    it "should exist" do
        visit authors_path
    end

    it "should have link to new author form" do
        visit authors_path
        expect(page).to have_link 'New Author', href: new_author_path
    end
end