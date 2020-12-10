input = File.open("in.txt").read
groups = input.split("\n\n")
count = 0

lettersHash = {
    "a" => 0,
    "b" => 1,
    "c" => 2,
    "d" => 3,
    "e" => 4,
    "f" => 5,
    "g" => 6,
    "h" => 7,
    "i" => 8,
    "j" => 9,
    "k" => 10,
    "l" => 11,
    "m" => 12,
    "n" => 13,
    "o" => 14,
    "p" => 15,
    "q" => 16,
    "r" => 17,
    "s" => 18,
    "t" => 19,
    "u" => 20,
    "v" => 21,
    "w" => 22,
    "x" => 23,
    "y" => 24,
    "z" => 25
}

def deleteCh(str, ch)
    newS = ""
    i = 0
    while i < str.length
        if str[i] != ch
            newS += str[i]
        end
        i += 1
    end
    return newS
end

i = 0
while i < groups.length
    people = groups[i].split("\n")

    
    letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    j = 0
    c = 0
    while j < letters.length
        found = true
        for str in people do
            if !str.include?(letters[j])
                found = false
            end
        end
        if found == true
            c += 1
        end
        j += 1
    end
    count += c
    i += 1
end
puts count