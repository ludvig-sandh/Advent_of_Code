def willHalt(inp)
    input = inp.dup
    ri = 0
    accumulator = 0
    been = []
    while ri < input.length
        row = input[ri]
        code = row.split()[0]
        arg = row.split()[1].to_i

        been[ri] = true

        if code == "nop"
            ri += 1
        elsif code == "acc"
            accumulator += arg
            ri += 1
        elsif code == "jmp"
            ri += arg
            if been[ri]
                return true
            end
        end
    end
    return accumulator
end
inpu = File.open("in.txt").readlines
i = 0
while i < inpu.length
    inp = File.open("in.txt").readlines
    if inp[i].split()[0] == "nop"
        inp[i][0] = "j"
        inp[i][1] = "m"
        inp[i][2] = "p"
    elsif inp[i].split()[0] == "jmp"
        inp[i][0] = "n"
        inp[i][1] = "o"
        inp[i][2] = "p"
    end
    val = willHalt(inp)
    if val == true

    else
        puts val
        exit
    end
    i += 1
end