input = File.open("in.txt").readlines

def evaluate(line)
    i = 0
    left = 0
    first = true
    while i < line.length
        if line[i] == "*" || line[i] == "+"
            if first
                left = line[i - 2]
                first = false
            end
            saveI = i
            last = 0
            if line[i + 2] == "("
                stack = ["("]
                j = i + 2
                while !stack.empty?
                    j += 1
                    if line[j] == "("
                        stack << "("
                    elsif line[j] == ")"
                        stack.pop()
                    end
                end
                last = evaluate(line[i + 3..j - 1])
                i = j
            else
                last = line[i + 2].to_i
            end
            if line[saveI] == "+"
                left = left.to_i + last
            elsif line[saveI] == "*"
                left = left.to_i * last
            end
        end
        i += 1
    end
    return left
end

def fixLine(line)
    len = line.length
    lastLen = -1
    while lastLen != len
        t = line.len
        if line.include?("*")
            ind = line.index("*")
            line.insert(ind + 2, "(")
            line.insert(ind - 1, ")")
            r = ind + 2
            stack = ["("]
            while !stack.empty?
                r += 1
                if line[r] == "("
                    stack << "("
                elsif line[r] == ")"
                    stack.pop()
                end
            end
                    

        end
        lastLen = t
    end
    return line
end

sum = 0
for line in input do
    newLine = fixLine(line)
    sum += evaluate(newLine)
end
puts sum