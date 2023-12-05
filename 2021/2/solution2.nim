import strutils
import sequtils

let contents = readFile("input.txt")
let directions = contents.splitLines()

var x_acc = 0
var depth_acc = 0
var aim = 0

for idx, val in directions.pairs:
    var i = split(val, " ")
    if i[0] == "forward":
        x_acc += parseInt(i[1])
        depth_acc += aim * parseInt(i[1])
    elif i[0] == "up":
        aim -= parseInt(i[1])
    elif i[0] == "down":
        aim += parseInt(i[1])

echo x_acc * depth_acc
