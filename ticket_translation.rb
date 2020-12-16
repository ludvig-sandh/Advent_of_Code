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

def rec(i, ticket, fields)
    p ticket
    if ticket.length == 0
        return []
    end

    ans = nil
    i = 0
    while i < fields.length
        newTicket = copy(ticket)
        start = newTicket.delete_at(i)
        puts start
        field = fields[i]
        ok = false
        j = 0
        while j < field.length
            if start >= field[j][0] && start <= field[j][1]
                ok = true
            end
            j += 1
        end
        if ok
            newFields = copy(fields).shift
            res = rec(i + 1, newTicket, newFields)
            if res != nil
                ans = res
                ans << start
                puts "----------------------------"
                puts start.class
                print ans
                return ans
            end
        end
        i += 1
    end
    return ans
end
p nearby[0]
puts "ans"
p rec(0, nearby[0].split(",").map(&:to_i), fields)