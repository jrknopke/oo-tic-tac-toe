class TicTacToe

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
    ]

    def initialize 
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_num)
        user_num.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end
    
    def position_taken?(index)
        @board[index] == " " ? false : true
    end

    def valid_move?(index)
        if index < 0 || index > 8
            false
        else 
            position_taken?(index) == false
        end
    end

    def turn_count
        #[" ", "O", "X"]
        @board.select{|space| space == "X" || space == "O"}.length
    end

    def current_player
        if turn_count.odd?
            "O"
        else
            "X"
        end
    end

    def turn
        #ask for input
        puts "Enter number from 1-9:"  
        # get input
        num = gets 
        # translate input into index
        num = input_to_index(num) 
        # if index is valid
        if valid_move?(num) 
            #   make the move for index
            move(num, current_player)
            #   show the board
            display_board
        # else
        else
            #   restart turn
            turn
        end
    end

    def won?
       WIN_COMBINATIONS.each{|win_array|
        index0 = win_array[0]
        index1 = win_array[1]
        index2 = win_array[2]

        space1 = @board[index0]
        space2 = @board[index1]
        space3 = @board[index2]

        if space1 == "X" && space2 == "X" && space3 == "X"
            return win_array
        elsif space1 == "O" && space2 == "O" && space3 == "O"
            return win_array
        end
    }
       return false
    end

    def full?
        @board.all? {|index| index == "X" || index == "O"}
    end

    def draw?
        if !won? && full? 
            true
        else
            false
        end
    end

    def over?
        if won? || draw?
            true
        else
            false
        end
    end

    def winner
        index = []
        index = won?
        if index == false
          return nil
        else
          if @board[index[1]] == "X"
            "X"
          else
            "O"
          end
        end
    end

    def play
        # until the game is over
        until over? == true
        #     take turns
            turn
        #   end
        end  
        #   if the game was won
        if won?
        #     congratulate the winner
            puts "Congratulations #{winner}!"
        #   else if the game was a draw
        elsif draw?
        #     tell the players it ended in a draw
            puts "Cat's Game!"
        #  end
        end
    end
end