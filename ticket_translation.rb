input = File.open("in.txt").read.split("\n\n")
fields = []
for row in input[0].split("\n") do
    times = row.split(": ")[1].split(" or ")
    fields << []
    i = 0
    while i < times.length
        l, r = times[i].split("-")
        fields[-1] << [l, r].map(&:to_i)
        i += 1
    end
end

mine = input[1].split("\n")[1].split(",").map(&:to_i)

nearby = input[2].split("\n")
error = 0
i = 1
while i < nearby.length
    nums = nearby[i].split(",").map(&:to_i)
    j = 0
    while j < nums.length
        existed = false
        k = 0
        while k < fields.length
            l = 0
            while l < fields[k].length
                if fields[k][l][0] <= nums[j] && fields[k][l][1] >= nums[j]
                    existed = true
                end
                l += 1
            end
            k += 1
        end
        if !existed
            nearby.delete_at(i)
            i -= 1
            break
        end
        j += 1
    end
    i += 1
end
nearby.shift

def copy(ar)
    newAr = []
    for a in ar do
        newAr << a
    end
    return newAr
end

def rec(i, tickets, fields, used = [], mem = [])
    if used.count(1) == fields.length
        return []
    end

    if mem[i] != nil
        if mem[i][used] != nil
            puts "reused"
            return mem[i][used]
        end
    else
        mem[i] = {}
    end

    j = 0
    while j < fields.length
        if used[j] == nil
            field = fields[j]
            possible = true
            k = 0
            while k < tickets.length
                ok = false
                l = 0
                while l < field.length
                    if tickets[k][i] >= field[l][0] && tickets[k][i] <= field[l][1]
                        ok = true
                    end
                    l += 1
                end
                if !ok
                    possible = false
                    break
                end
                k += 1
            end
            if possible
                copyUsed = copy(used)
                copyUsed[j] = 1
                res = rec(i + 1, tickets, fields, copyUsed)
                if res != nil
                    return mem[i][used] = res + [j]
                end
            end
        end
        j += 1
    end
    return mem[i][used] = nil
end

i = 0
while i < nearby.length
    nearby[i] = nearby[i].split(",").map(&:to_i)
    i += 1
end
order = rec(0, nearby, fields).reverse
p order
ans = 1
i = 0
while i < order.length
    if order[i] < 6
        ans *= mine[i]
        puts "counting"
    end
    i += 1
end
puts ans