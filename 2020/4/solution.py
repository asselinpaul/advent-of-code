lines = open("input.txt").read().split("\n\n")

results = []

tokens = [
    "byr",
    "iyr",
    "eyr",
    "hgt",
    "hcl",
    "ecl",
    "pid",
]

for line in lines:
    valid = True
    for token in tokens:
        if token not in line:
            valid = False
            break
    results.append(valid)

print(len(filter(lambda x: x, results)))
