Chess Validator

A company that specializes in building mediocre games for social networking platforms has offered you a fistful of cash in the form of a one percent profit sharing agreement and free pizza. All you need to do is prove that you're the kind of rockstar programmer they need on staff by taking a simple test. Because you know that you're exactly the sort of ninja frogman devops superstar that they're looking for, you decide to give it a shot.

Your task is to create a Chess move validator: given a list of moves and a board, you are expected to determine whether each move is LEGAL or ILLEGAL. Some sample input and output files are provided to make this task a little bit easier for you to work on.

The Board

The board is represented in the simple ASCII format shown below:

bR bN bB bQ bK bB bN bR
bP bP bP bP bP bP bP bP
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
-- -- -- -- -- -- -- --
wP wP wP wP wP wP wP wP
wR wN wB wQ wK wB wN wR
Each piece is represented by two characters. The first character represents the player's color, and the second character represents the rank of the piece. Empty squares are represented by --.
