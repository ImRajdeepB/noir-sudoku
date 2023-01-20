use dep::std;

fn less_than_eq(x : Field, y : Field) -> bool {
    x as u32 <= y as u32
}

fn is_zero(x : Field) -> bool {
    x as u32 == 0
}

fn is_equal(x : Field, y : Field) -> bool {
    x as u32 == y as u32
}

fn sudoku(puzzle : [Field; 81], solution : [Field; 81]) {
    // Check if all the numbers lie between 1 and 9
    for row in 0..9 {
        for col in 0..9 {
            let lt_nine = less_than_eq(solution[row*9+col], 9);
            let gt_one = less_than_eq(1, solution[row*9+col]);

            constrain lt_nine == gt_one;
        }
    }

    // Check if puzzle is the initial state of solution
    // If puzzle[row][col] is not zero, make sure solution[row][col] is equal to puzzle[row][col]
    // If puzzle[row][col] is zero, make sure solution [row][col] is different from puzzle[row][col]
    for row in 0..9 {
        for col in 0..9 {
            let ie_board = is_equal(solution[row*9+col], puzzle[row*9+col]);
            let iz_board = is_zero(puzzle[row*9+col]);

            constrain ie_board != iz_board;
        }
    }

    // Check if each row in solution has all the numbers from 1 to 9, both included
    // For each element in solution, check that this element is not equal
    // to previous elements in the same row
    for row in 0..9 {
        for col in 0..9 {
            for c in 0..col {
                constrain is_equal(solution[row*9+c], solution[row*9+col]) == false;
            }
        }
    }

    // Check if each column in solution has all the numbers from 1 to 9, both included
    // For each element in solution, check that this element is not equal
    // to previous elements in the same column
    for row in 0..9 {
        for col in 0..9 {
            for r in 0..row {
                constrain is_equal(solution[r*9+col], solution[row*9+col]) == false;
            }
        }
    }

    // TODO: Check for validity of subgrids
}
