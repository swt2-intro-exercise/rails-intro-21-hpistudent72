describe "Author Model", type: :model do
  it "should have Alan Turing, http://wikipedia.de/Alan_Turing" do
      author = Author.new(first_name:'Alan', last_name:'Turing', homepage: 'http://wikipedia.de/Alan_Turing')
      expect(author.first_name).to eq('Alan')
      expect(author.last_name).to eq('Turing')
      expect(author.homepage).to eq('http://wikipedia.de/Alan_Turing')
      expect(author.name).to eq('Alan Turing')
  end

  it "should inavlidate forms with no last name" do
    author = Author.new(first_name:'Alan', homepage: 'http://wikipedia.de/Alan_Turing')
    expect(author).to_not be_valid
  end
end
