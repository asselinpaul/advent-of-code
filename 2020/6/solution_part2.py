lines = open("input.txt").read().split("\n\n")

uniques = []

for line in lines:
    individual_answers = line.split()
    sets = [set(x) for x in individual_answers]
    unique_chars = sets[0].intersection(*sets[1:])
    uniques.append(len(unique_chars))

print(sum(uniques))
