class Author < ApplicationRecord
    def intialize(first_name, last_name, homepage)
        @first_name = first_name
        @last_name = last_name
        @homepage = homepage
    end

    def name
        return first_name + ' ' + last_name
    end
end
