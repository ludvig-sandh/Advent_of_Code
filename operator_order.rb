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

def reAddM(str)
    i = 0
    while i < str.length
        if str[i] == "^"
            str[i] = "*"
        end
        i += 1
    end
    return str
end

def removeIndex(str, index)
    i = 0
    newStr = ""
    while i < str.length
        if i != index
            newStr += str[i]
        end
        i += 1
    end
    return newStr
end

def removeSinglePars(str)
    i = 0
    while i < str.length
        if str[i] == "(" && str[i + 2] == ")"
            str = removeIndex(str, i)
            str = removeIndex(str, i + 1)
        end
        i += 1
    end
    return str
end


def fixLine(line)
    lastLen = -1
    while lastLen != line.length
        t = line.length
        if line.include?("*")
            ind = line.index("*")
            stack = []
            l = ind - 1
            while l >= 0
                if l == 0
                    line.insert(0, "(")
                    break
                end
                if line[l] == "*"
                    line.insert(l + 2, "(")
                    break
                end
                if line[l] == "(" && stack.empty?
                    line.insert(l, "(")
                    break
                end
                if line[l] == ")"
                    stack << ")"
                elsif line[l] == "("
                    stack.pop()
                end
                l -= 1
            end
            ind = line.index("*")
            stack = []
            r = ind + 2
            while r < line.length
                if r == line.length - 1
                    line.insert(line.length, ")")
                    break
                end
                if line[r] == "*" && stack.empty?
                    line.insert(r - 1, ")")
                    break
                end
                if line[r] == ")" && stack.empty?
                    line.insert(r, ")")
                    break
                end
                if line[r] == "("
                    stack << "("
                elsif line[r] == ")"
                    stack.pop()
                end
                r += 1
            end
            ind = line.index("*")
            line.insert(ind + 2, "(")
            line.insert(ind - 1, ")")
            line[ind + 1] = "^"
        end
        lastLen = t
    end
    return reAddM(line)
end

sum = 0
for line in input.map(&:chomp) do
    newLine = fixLine(line)
    newLine = removeSinglePars(newLine)
    ans = evaluate(newLine)
    if ans == 0
        p newLine
    end
    sum += ans
end
puts sum