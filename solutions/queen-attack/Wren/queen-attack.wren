class QueenAttack {  
  construct new(pieces) {
    _white = pieces["white"] || [7, 3]
    _black = pieces["black"] || [0, 3]
    var valid = [_white, _black].all { |queen|
      return queen.all {|coord| (0..7).contains(coord)}
    }
    if (!valid) Fiber.abort("Queen must be placed on the board")
    
    if ([0, 1].all {|coord| _white[coord] == _black[coord]}) {
      Fiber.abort("Queens cannot share the same space")
    }
  }

  static new() {this.new({})}

  white { _white }
  black { _black }

  canAttack {
    var dx = (_white[0] - _black[0]).abs
    var dy = (_white[1] - _black[1]).abs
    return dx == 0 || dy == 0 || dx == dy
  }

  toString {
    var board = (0..7).map {|i| List.filled(8, "_")}.toList
    board[_white[0]][_white[1]] = "W"
    board[_black[0]][_black[1]] = "B"
    return board.map {|row| row.join(" ")}.join("\n")
  }
}