input = File.open("in.txt").readlines
start = input[0].chomp.to_i
periods = []
row = input[1].split(",")
i = 0
while i < row.length
    if row[i] != "x"
        periods[i] = row[i].to_i
    end
    i += 1
end

i = 0
lastK = 1
lastM = 0
while i < periods.length
    if periods[i] != nil
        found = []
        c = lastM
        while found.length < 2
            if (c + i) % periods[i] == 0
                found << c
            end
            c += lastK
        end
        lastM = found[0]
        lastK = found[1] - lastM
    end
    i += 1
end

puts lastM