class Grid


  attr_reader :cells
 
  def initialize(puzzle)
    @cells = puzzle_to_cells(puzzle)
  end

  def first_cell
    @cells[0].value
  end

  def value_array puzzle
    puzzle.scan(/.{1}/).map(&:to_i)
  end

  def puzzle_to_cells puzzle
    cells = []
    value_array(puzzle).each_with_index do |value, index|
      cells << Cell.new(index,[],value)
    end
    cells.each { |cell| cell.puzzle = cells }
  end

  def solve
    outstanding_before, looping = @cells.count {|c| c.solved? }, false
    while !solved? && !looping
      try_to_solve
      outstanding         = @cells.count {|c| c.solved? }
      looping             = outstanding_before == outstanding       
      outstanding_before  = outstanding     
    end 
  end

  def try_to_solve
    @cells.each { |cell| cell.solve }
  end

  def solved?
    @cells.all? { |cell| cell.solved? }
  end

  def inspect
    grid_string = ''
    cell_values_array.each do |row|
      row.each do |value|
        grid_string << value.to_s
      end
      grid_string << '
'
    end
    grid_string[0..-2]
  end

  def cell_values_array
    @cells.map(&:value).each_slice(9).to_a
  end

end