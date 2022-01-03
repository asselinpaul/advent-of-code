import strutils
import sequtils

let contents = readFile("input.txt")
let lines = contents.splitLines()

var row = newSeq[int](1000)
var board = newSeqWith(1000, row)

for val in lines:
    let line_seq = val.split(" -> ")
    let from_c = map(line_seq[0].split(","), proc(x: string): int = parseInt(x))
    let to_c = map(line_seq[1].split(","), proc(x: string): int = parseInt(x))
    if from_c[0] == to_c[0] and from_c[1] != to_c[1]:
        # vertical, same x
        var x = from_c[0]
        for y in min(from_c[1], to_c[1]) .. max(from_c[1], to_c[1]):
            board[y][x] += 1
    if from_c[1] == to_c[1] and from_c[0] != to_c[0]:
        # horizontal, same y
        var y = from_c[1]
        for x in min(from_c[0], to_c[0]) .. max(from_c[0], to_c[0]):
            board[y][x] += 1


var acc = 0
for row in board:
    acc += len(row.filterIt(it >= 2))

echo "solution: ", acc
