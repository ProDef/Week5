require 'grid'

describe Grid do
  context "initialization" do
    let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' } # it's an easy sudoku puzzle, row by row
    let(:solved_puzzle) { '1151131121111119162711684314911121175111413811139151119111811418617125137214611' } # it's an easy sudoku puzzle, row by row
    let(:web_puzzle) { '102004070000902800009003004000240006000107000400068000200800700007501000080400109' }
    let(:false_puzzle) { '102004077700902800009003004000240007770107000400068000200770700007501777780400109' }
    let(:grid) { Grid.new(puzzle) }
    let(:cell) { double :cell }
   
    it 'should have 81 cells' do
        expect(grid.cells.length).to eq 81
    end
    
    it 'should have an unsolved first cell' do
        expect(grid.first_cell).to eq 0
    end

    it "makes an array of cells from the puzzle string" do
        expect(grid.cells[28].value).to eq 9
    end

    it "has cells that know what puzzle they are in" do
        expect(grid.cells[73].puzzle.count).to eq 81
    end

    it "can print out what it looks like" do
        expect(grid.inspect).to eq '015003002
000100906
270068430
490002017
501040380
003905000
900081040
860070025
037204600'
    end

    it "knows it is not solved" do
        expect(grid).not_to be_solved
    end

    it "knows it is solved" do
        grid = Grid.new solved_puzzle
        expect(grid).to be_solved
    end

    it "can solve itself" do
        grid = Grid.new puzzle
        puts grid.inspect
        puts "Solving.........."
        puts '- - - - -'
        grid.solve
        expect(grid).to be_solved
        puts grid.inspect
        puts "Solved"

    end

    it "can solve itself from the web" do
        grid = Grid.new web_puzzle
        puts grid.inspect
        puts "Solving.........."
        puts "- - - - -"
        grid.solve
        expect(grid).to be_solved
        puts grid.inspect
        puts "Solved"
    end

    it "cannot solve a false Sudoku" do
        grid = Grid.new false_puzzle
        puts grid.inspect
        puts "solving.........."
        puts "- - - - -"
        grid.solve
        expect(grid).to_not be_solved
        puts grid.inspect
        puts "Unsolved"
    end

  end
end

# describe Grid do
#   let(:grid) { #init in here }
#   context "solving sudoku" do
#     it "can solve the puzzle" do
#       expect(grid.solved?).to be_false
#       grid.solve
#       expect(grid.solved?).to be_true
#       expect(grid.to_s).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
#     end
#   end
# end

# 615493872
# 348127956
# 279568431
# 496832517
# 521746389
# 783915264
# 952681743
# 864379125
# 137254698