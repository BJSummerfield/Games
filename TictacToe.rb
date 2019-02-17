def run_game
  puts "Enter 1 for one player"
  puts "Enter 2 for two player"
  input = gets.chomp
  if input == "1"
    new_board
    while true
      print_grid
      user_turn
      comp_turn
    end
  elsif input == "2"
    new_board
    while true
      print_grid
      user_turn
      opp_turn
    end
  end
end

def new_board
  @a1 = " "
  @a2 = " "
  @a3 = " "
  @b1 = " "
  @b2 = " "
  @b3 = " "
  @c1 = " "
  @c2 = " "
  @c3 = " "
end

def squares
  [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
end

def print_grid
  reset_screen
  start_game
  puts
  puts "   1   2   3"
  puts "A  #{@a1} | #{@a2} | #{@a3} " 
  puts "  ---|---|---"
  puts "B  #{@b1} | #{@b2} | #{@b3} "
  puts "  ---|---|---"
  puts "C  #{@c1} | #{@c2} | #{@c3} "
  puts
  check_for_winner
end

def user_turn
  user_choice_hash = {
    "a1" => @a1,
    "a2" => @a2,
    "a3" => @a3,
    "b1" => @b1,
    "b2" => @b2,
    "b3" => @b3,
    "c1" => @c1,
    "c2" => @c2,
    "c3" => @c3}                
error = false
  until error == true
    puts "Please choose a square:"
    user_choice = gets.chomp.downcase
    user_choice_hash.each do |choice, square|
      if user_choice == choice 
        if check_validity(square)
          square.sub!(" ", "X")
          error = true
        end
      elsif user_choice == "q" or user_choice == "quit"
        exit
      end
    end
    print_grid
    puts "Invalid Entry" if error == false
  end
end

def opp_turn
  user_choice_hash = {
    "a1" => @a1,
    "a2" => @a2,
    "a3" => @a3,
    "b1" => @b1,
    "b2" => @b2,
    "b3" => @b3,
    "c1" => @c1,
    "c2" => @c2,
    "c3" => @c3}                
error = false
  until error == true
    puts "Please choose a square:"
    user_choice = gets.chomp.downcase
    user_choice_hash.each do |choice, square|
      if user_choice == choice 
        if check_validity(square)
          square.sub!(" ", "O")
          error = true
        end
      elsif user_choice == "q" or user_choice == "quit"
        exit
      end
    end
    print_grid
    puts "Invalid Entry" if error == false
  end
end

def comp_turn
  squares.shuffle.each do |square|
    if check_validity(square)
      square.gsub!(" ", "O")
      break
    end
  end
end

def check_validity square_availability
  if square_availability == " "
    true
  end
end

def check_for_winner 
  tie = false
  win_combos.each do |combos| 
    if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
      puts "O's Win!"
      exit 
    elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
      puts "X's Win!"
      exit
    else
      unless squares.include?(" ") 
        tie = true
      end
    end
  end
    if tie == true
      reset_screen
      puts "Tie Game - Try again!"
      sleep(3)
      run_game
    end
end

def win_combos 
  [[@a1, @a2, @a3],
  [@a1, @b2, @c3],
  [@a1, @b1, @c1],
  [@b1, @b2, @b3],
  [@c1, @c2, @c3],
  [@c1, @b2, @a3],
  [@a2, @b2, @c2],
  [@a3, @b3, @c3]]
end

def start_game
  puts "Welcome to Tic Tac Toe!" 
  puts "To place your X on the grid, enter the location (ex--a1, b3)."
  puts "To quit, enter q at any time"
end

def reset_screen 
  print "\e[2J"
  print "\e[H"
end

run_game