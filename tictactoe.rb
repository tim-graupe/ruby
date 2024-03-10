class TicTacToe
    def initialize
      @board = Array.new(9, ' ')
      @current_player = 'X'
      @winner = nil
      @turns_taken = 0
    end
  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts '---+---+---'
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts '---+---+---'
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  
    def make_move(position)
      if valid_move?(position)
        @board[position] = @current_player
        @turns_taken += 1
        check_winner
        switch_player
      else
        puts 'Invalid move. Please choose an empty position.'
      end
    end
  
    def valid_move?(position)
      @board[position] == ' '
    end
  
    def switch_player
      @current_player = (@current_player == 'X') ? 'O' : 'X'
    end
  
    def check_winner
      winning_combinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal wins
        [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical wins
        [0, 4, 8], [2, 4, 6]              # diagonal wins
      ]
  
      winning_combinations.each do |combo|
        if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != ' '
          @winner = @current_player
          return
        end
      end
  
      @winner = 'Tie' if @turns_taken == 9
    end
  
    def display_winner
      case @winner
      when 'X', 'O'
        puts "#{@winner} wins!"
      when 'Tie'
        puts "It's a tie!"
      else
        puts 'No winner yet.'
      end
    end
  end
  
  game = TicTacToe.new
  
  loop do
    game.display_board
    puts "Current player: #{game.instance_variable_get(:@current_player)}"
    print 'Enter your move (0-8): '
    move = gets.chomp.to_i
  
    game.make_move(move)
  
    game.display_winner
    break if game.instance_variable_get(:@winner) || game.instance_variable_get(:@turns_taken) == 9
  end
  