def letterCount(word, hash)
    counts = []
    i = 0
    while i < word.length
        if counts[hash[word[i]]] == nil
            counts[hash[word[i]]] = 0
        end
        counts[hash[word[i]]] += 1
        i += 1
    end
    return counts
end

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

input = File.open("help.txt").readlines
count = 0
i = 0
while i < input.length
    row = input[i].split
    allowed = row[0].split("-").map(&:to_i)
    letter = row[1][0]
    puts letter
    print(allowed)
    password = row[2]
    puts password[allowed[0] - 1]
    puts password[allowed[1] - 1]
    found = 0
    if password[allowed[0] - 1] == letter
        found += 1
    end
    if password[allowed[1] - 1] == letter
        found += 1
    end
    if found == 1
        count += 1
    end
    i += 1
end

puts count

