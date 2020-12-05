input = File.open("in.txt").readlines
i = 0
ids = []
while i < input.length
    row = input[i].chomp
    lrow = 0
    rrow = 127
    lcol = 0
    rcol = 7
    j = 0
    while j < row.length
        letter = row[j]
        dif = ((rrow - lrow) / 2.0).ceil
        dif2 = ((rcol - lcol) / 2.0).ceil
        if letter == "F"
            rrow -= dif
        elsif letter == "B"
            lrow += dif
        elsif letter == "L"
            rcol -= dif2
        elsif letter == "R"
            lcol += dif2
        end
        j += 1 
    end
    id = rrow * 8 + rcol
    ids[i] = id
    i += 1
end

ids.sort!
last = 0
i = 0
while i < ids.length
    if ids[i] != last + 1
        puts ids[i]
    end
    last = ids[i]
    i += 1
end