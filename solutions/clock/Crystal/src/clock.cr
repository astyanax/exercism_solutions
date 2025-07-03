class Clock
    property hour, minute
    #def_hash @hour, @minute

    def initialize(@hour : Int32 = 0, @minute : Int32 = 0)
        @hour = (hour + minute // 60) % 24
        @minute = minute % 60
    end

    def to_s(io : IO) : Nil
        io << self.@hour.to_s.rjust(2, '0') << ':' << self.@minute.to_s.rjust(2, '0')
    end

    def +(@c : Clock): self
        @hour = (@hour + c.hour + (@minute + c.minute)// 60 ) % 24
        @minute = (@minute + c.minute) % 60
        self
    end

    def -(@c : Clock): self
        @hour = (@hour - c.hour + (@minute - c.minute)//60 ) % 24
        @minute = (@minute - c.minute) % 60
        self
    end

    def ==(c : Clock)
        @minute == c.minute && @hour == c.hour
    end
end
