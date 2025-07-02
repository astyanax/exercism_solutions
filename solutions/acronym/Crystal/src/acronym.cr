class Acronym
    def self.abbreviate(sen : String)
        sen.gsub(/[^A-Za-z\d- ]/, "").split(/\W+/).map{|w|w[0]}.join.upcase
    end
end