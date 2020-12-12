instr = File.open("in.txt").readlines.map(&:chomp)
east = 0
north = 0
facing = "E"
wayEast = 10
wayNorth = 1

nexts = ["E", "N", "W", "S"]

def find(ar, val)
    i = 0
    while i < ar.length
        if ar[i] == val
            return i
        end
        i += 1
    end
end

i = 0
while i < instr.length
    letter = instr[i][0]
    val = instr[i][1..-1].to_i
    if letter == "F"
        j = 0
        while j < val
            east += wayEast
            north += wayNorth
            j += 1
        end
    elsif letter == "N"
        wayNorth += val
    elsif letter == "S"
        wayNorth -= val
    elsif letter == "E"
        wayEast += val
    elsif letter == "W"
        wayEast -= val
    elsif letter == "R"
        j = 0
        while j < val / 90
            temp = wayEast
            wayEast = wayNorth
            wayNorth = -temp
            j += 1
        end
    elsif letter == "L"
        j = 0
        while j < val / 90
            temp = wayEast
            wayEast = -wayNorth
            wayNorth = temp
            j += 1
        end
    end
    i += 1
end

puts north.abs + east.abs