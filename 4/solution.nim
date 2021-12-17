import strutils
import sequtils
import parseutils

let board_size = 5
                          
let contents = readFile("input.txt") 
let lines = contents.splitLines()

let input_seq = lines[0].split(",")


# populate boards
var row = newSeq[string](board_size)
var board = newSeqWith(board_size, row)
var boards = newSeq[board](0)

var acc = 0

for n in 1..<lines.len:
    if lines[n] == "": continue
    var line = filter(split(lines[n], " "), proc(x: string): bool = x != "")
    board[acc] = line
    acc += 1
    if acc == board_size:
        boards.add(board)
        acc = 0
let boards_inital = boards

# define check_win_condition
proc check_win_condition(b: board.type): bool =
    let complete_seq = newSeqWith(board_size, "x")
    for row in b:
        # row condition
        if row == complete_seq:
            return true
    for col_count in 0..<board_size:
        # column condition
        var col: seq[string] = @[] 
        for i in b.mapIt((it[col_count])):
            col.add(i)
        if col == complete_seq:
            return true
    return false

# define calc_score
proc calc_score(b: board.type): int =
    var sum = 0
    for row in b:
        sum += foldl(row.filterIt(it != "x").mapIt(parseInt(it)), a + b, 0)
    return sum

# go through draw
for i in input_seq:
    for b_idx in boards.low..boards.high:
        for r_idx in boards[b_idx].low..boards[b_idx].high:
            # mark the board
            boards[b_idx][r_idx] = boards[b_idx][r_idx].mapIt((if it == i: "x" else: it))
        # check if board won
        if check_win_condition(boards[b_idx]):
            echo "board with marks: ", boards[b_idx]
            echo "original board: ", boards_inital[b_idx]
            echo "sum of unmarked numbers: ", calc_score(boards[b_idx])
            echo "number just called: ", i
            echo "score: ", parseInt(i) * calc_score(boards[b_idx])
            quit(0)