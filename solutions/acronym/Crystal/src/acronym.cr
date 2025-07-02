class Acronym
    def self.abbreviate(phrase : String)
        phrase.gsub(/[^0-9A-Za-z -]/, "").split(/\W+/).map{|word|word[0]}.join.upcase
    end
end