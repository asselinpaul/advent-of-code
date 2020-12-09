with open("input.txt") as f:
    lines = [line.rstrip() for line in f]

x, y = 0, 0
tree_count = 0
line_length = len(lines[0])

while y < len(lines) - 1:
    x = (x + 3) % line_length
    y = y + 1
    if lines[y][x] == "#":
        tree_count += 1

print(tree_count)
