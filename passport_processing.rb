input = File.open("help.txt").read
passports = input.split("\n\n")
i = 0
count = 0
needed = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
while i < passports.length
    rows = passports[i].split("\n")
    c = 0
    j = 0
    while j < rows.length
        atts = rows[j].split(" ")
        k = 0
        while k < atts.length
            attssplit = atts[k].split(":")
            att = attssplit[0]
            valS = attssplit[1]
            if att == "byr"
                val = valS.to_i
                if val >= 1920 && val <= 2002
                    c += 1
                end
            elsif att == "iyr"
                val = valS.to_i
                if val >= 2010 && val <= 2020
                    c += 1
                end
            elsif att == "eyr"
                val = valS.to_i
                if val >= 2020 && val <= 2030
                    c += 1
                end
            elsif att == "hgt"
                val = valS.to_i
                if valS[-2] == "c" && valS[-1] == "m"
                    if val >= 150 && val <= 193
                        c += 1
                    end
                elsif valS[-2] == "i" && valS[-1] == "n"
                    if val >= 59 && val <= 76
                        c += 1
                    end
                end
            elsif att == "hcl"
                val = valS[1..-1]
                if valS[0] == "#"
                    if val.length == 6
                        c += 1
                    end
                end
            elsif att == "ecl"
                if valS == "amb" || valS == "blu" || valS == "brn" || valS == "gry" || valS == "grn" || valS == "hzl" || valS == "oth"
                    c += 1
                end
            elsif att == "pid"
                if valS.length == 9
                    c += 1
                end
            end
            k += 1
        end
        j += 1
    end
    if c >= 7
        count += 1
    end
    i += 1
end

puts count