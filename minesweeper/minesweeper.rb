def print_board board, mines=false
  (0...board.length).each do |x|
    (0...board[x].length).each do |y|
      if mines
        print "#{mines_number board, x, y} "
      else
        print "#{board[x][y]} "
      end
    end
    puts
  end
end

def mines_number board, x, y
  if board[x][y] == "X"
    return board[x][y]
  end
  
  bombs = 0
  min_x = x - 1 > 0 ? x - 1: 0
  max_x = x + 1 < board.length ? x + 1: board.length - 1
  min_y = y - 1 > 0 ? y - 1: 0
  max_y = y + 1 < board[min_x].length ? y + 1: board[min_x].length - 1

  (min_x..max_x).each do |x|
    (min_y..max_y).each do |y|
      if board[x][y] == "X"
        bombs += 1
      end
    end
  end

  bombs
end

text_board = "0 0 0 X 0\n0 X 0 X 0\n0 0 0 0 X"

board = []
rows = text_board.split("\n")
rows.each_index do |row_index|
  board[row_index] = rows[row_index].split(" ")
end

print_board board
puts
print_board board, true
