mod sudoku;

fn main(puzzle : pub [Field; 81], solution : [Field; 81]) {
    sudoku::sudoku(puzzle, solution);
}
