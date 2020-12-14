input = File.open("in.txt").readlines.map(&:chomp)
mask = ""
mem = {}
i = 0


def setAllMems(code, val, mem)
    i = 0
    checked = false
    while i < code.length
        if code[i] == "X"
            checked = true
            newCode = code.dup
            newCode[i] = "1"
            setAllMems(newCode, val, mem)
            newCode[i] = "0"
            setAllMems(newCode, val, mem)
            break
        end
        i += 1
    end
    if !checked
        mem[code] = val.to_i
        #puts val.to_i
    end
end


while i < input.length
    if input[i].include? "mask"
        mask = input[i].split(" = ")[1]
    else
        leftB = input[i].index("[")
        rightB = input[i].index("]")
        place = input[i][leftB + 1..rightB - 1].to_i.to_s(2)
        num = input[i].split(" = ")[1].to_i
        if place.length < mask.length
            place = "0" * (mask.length - place.length) + place
        end
        j = 0
        while j < mask.length
            if mask[-j] == "X" || mask[-j] == "1"
                place[-j] = mask[-j]
            end
            j += 1
        end
        setAllMems(place, num, mem)
    end
    i += 1
end

sum = 0
i = 0
for k in mem.values do
    sum += k
end
puts sum