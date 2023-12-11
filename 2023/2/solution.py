import re


def parse_color_string(s):
    pattern = r"(\d+)\s+(\w+)"
    matches = re.findall(pattern, s)
    return {color: int(number) for number, color in matches}


lines = open("input.txt").read().split("\n")

acc = 0

real_red = 12
real_green = 13
real_blue = 14

for line in lines:
    game_number = int(line.split(": ")[0].split(" ")[1])
    revealed = map(parse_color_string, line.split(": ")[1].split(";"))
    possible = True
    for i in revealed:
        if (
            i.get("red", 0) > real_red
            or i.get("green", 0) > real_green
            or i.get("blue", 0) > real_blue
        ):
            possible = False
            break
    if possible:
        acc += game_number

print(acc)
