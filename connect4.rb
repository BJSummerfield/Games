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
      two_turn
    end
  end
end



def print_grid
  reset_screen
  start_game
  puts
  puts "   1   2   3   4   5   6   7"
  puts " |---|---|---|---|---|---|---|"
  puts " | #{@a1} | #{@b1} | #{@c1} | #{@d1} | #{@e1} | #{@f1} | #{@g1} |" 
  puts " |---|---|---|---|---|---|---|"
  puts " | #{@a2} | #{@b2} | #{@c2} | #{@d2} | #{@e2} | #{@f2} | #{@g2} |" 
  puts " |---|---|---|---|---|---|---|"
  puts " | #{@a3} | #{@b3} | #{@c3} | #{@d3} | #{@e3} | #{@f3} | #{@g3} |"
  puts " |---|---|---|---|---|---|---|" 
  puts " | #{@a4} | #{@b4} | #{@c4} | #{@d4} | #{@e4} | #{@f4} | #{@g4} |" 
  puts " |---|---|---|---|---|---|---|"
  puts " | #{@a5} | #{@b5} | #{@c5} | #{@d5} | #{@e5} | #{@f5} | #{@g5} |"
  puts " |---|---|---|---|---|---|---|" 
  puts " | #{@a6} | #{@b6} | #{@c6} | #{@d6} | #{@e6} | #{@f6} | #{@g6} |" 
  puts " |---|---|---|---|---|---|---|"
  check_win
end

def user_choice_hash
  user_choice_hash = {
    "1" => [@a1,@a2,@a3,@a4,@a5,@a6],
    "2" => [@b1,@b2,@b3,@b4,@b5,@b6],
    "3" => [@c1,@c2,@c3,@c4,@c5,@c6],
    "4" => [@d1,@d2,@d3,@d4,@d5,@d6],
    "5" => [@e1,@e2,@e3,@e4,@e5,@e6],
    "6" => [@f1,@f2,@f3,@f4,@f5,@f6],
    "7" => [@g1,@g2,@g3,@g4,@g5,@g6]
    }  
end

def user_turn
  error = false
  until error == true  
    input = gets.chomp.downcase
    user_choice_hash.each do |key, column|
      if input == key
        if full_column?(column)
          i = 0
          column.each do
            if column[i] == " "
              i += 1
            else
              break
            end
          end
          column[i-1].sub!(" ", "X") 
          error = true
        end
        elsif input == "q"
        exit 
      end
    end
    print_grid
    puts "Invalid entry, try again:" if error == false
  end
end

def two_turn
  error = false
  until error == true  
    input = gets.chomp.downcase
    user_choice_hash.each do |key, column|
      if input == key
        if full_column?(column)
          i = 0
          column.each do
            if column[i] == " "
              i += 1
            else
              break
            end
          end
          column[i-1].sub!(" ", "O") 
          error = true
        end
        elsif input == "q"
        exit 
      end
    end
    print_grid
    puts "Invalid entry, try again:" if error == false
  end
end

def full_column? column_free
  if column_free[0] == " "
    true
  end
end

def columns
  ["1","2","3","4","5","6","7"]
end

def comp_turn
  error = false
  until error == true 
    input = columns.shuffle[0]  
      user_choice_hash.each do |key,column|
        if input == key
          if full_column?(column)
            i = 0
            column.each do
              if column[i] == " "
                i += 1
              else
                break
              end
            end
            column[i-1].gsub!(" ", "O")
            error = true
            break
          else
            break
          end
        end
      end
  end
end 

def check_win
  tie = false
  toprow = [@a1,@b1,@c1,@d1,@e1,@f1,@g1]
  win_combos.each do |combos|
    if combos[0] == "O" && combos[1] == "O" && combos[2] == "O" && combos[3] == "O"
      puts "O's Win!"
      exit
    elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X" && combos[3] == "X"
      puts "X's Win!"
      exit
    else
      unless toprow.include?(" ")
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
      
def start_game
  puts "Welcome to Connect 4!" 
  puts "To place your marker, enter a column number."
  puts "To quit, enter q at any time"
end

def reset_screen 
  print "\e[2J"
  print "\e[H"
end

def win_combos
  [
   [@a6,@b5,@c4,@d3],# Di-Right
   [@b6,@c5,@d4,@e3],
   [@c6,@d5,@e4,@f3],
   [@d6,@e5,@f4,@g3],
   [@a5,@b4,@c3,@d2],
   [@b5,@c4,@d3,@e2],
   [@c5,@d4,@e3,@f2],
   [@d5,@e4,@f3,@g2],
   [@a4,@b3,@c2,@d1],
   [@b4,@c3,@d2,@e1],
   [@c4,@d3,@e2,@f1],
   [@d4,@e3,@f2,@g1],# Di-Left
   [@g6,@f5,@e4,@d3],
   [@f6,@e5,@d4,@c3],
   [@e6,@d5,@c4,@b3],
   [@d6,@c5,@b4,@a3],
   [@g5,@f4,@e3,@d2],
   [@f5,@e4,@d3,@c2],
   [@e5,@d4,@c3,@b2],
   [@d5,@c4,@b3,@a2],
   [@g4,@f3,@e2,@d1],
   [@f4,@e3,@d2,@c1],
   [@e4,@d3,@c2,@b1],
   [@d4,@c3,@b2,@a1],#Rows
   [@g6,@f6,@e6,@d6],
   [@f6,@e6,@d6,@c6],
   [@e6,@d6,@c6,@b6],
   [@d6,@c6,@b6,@a6],
   [@g5,@f5,@e5,@d5],
   [@f5,@e5,@d5,@c5],
   [@e5,@d5,@c5,@b5],
   [@d5,@c5,@b5,@a5],
   [@g4,@f4,@e4,@d4],
   [@f4,@e4,@d4,@c4],
   [@e4,@d4,@c4,@b4],
   [@d4,@c4,@b4,@a4],
   [@g3,@f3,@e3,@d3],
   [@f3,@e3,@d3,@c3],
   [@e3,@d3,@c3,@b3],
   [@d3,@c3,@b3,@a3],
   [@g2,@f2,@e2,@d2],
   [@f2,@e2,@d2,@c2],
   [@e2,@d2,@c2,@b2],
   [@d2,@c2,@b2,@a2],
   [@g1,@f1,@e1,@d1],
   [@f1,@e1,@d1,@c1],
   [@e1,@d1,@c1,@b1],
   [@d1,@c1,@b1,@a1],
   [@a4,@a3,@a2,@a1],#columns
   [@a6,@a5,@a4,@a3],
   [@b6,@b5,@b4,@b3],
   [@c6,@c5,@c4,@c3],
   [@d6,@d5,@d4,@d3],
   [@e6,@e5,@e4,@e3],
   [@f6,@f5,@f4,@f3],
   [@g6,@g5,@g4,@g3],
   [@a5,@a4,@a3,@a2],
   [@b5,@b4,@b3,@b2],
   [@c5,@c4,@c3,@c2],
   [@d5,@d4,@d3,@d2],
   [@e5,@e4,@e3,@e2],
   [@f5,@f4,@f3,@f2],
   [@g5,@g4,@g3,@g2],
   [@a4,@a3,@a2,@a1],
   [@b4,@b3,@b2,@b1],
   [@c4,@c3,@c2,@c1],
   [@d4,@d3,@d2,@d1],
   [@e4,@e3,@e2,@e1],
   [@f4,@f3,@f2,@f1],
   [@g4,@g3,@g2,@g1]
  ]
end

def new_board
  @a1 = " " 
  @a2 = " "
  @a3 = " "
  @a4 = " "
  @a5 = " "
  @a6 = " "
  @b1 = " "
  @b2 = " "
  @b3 = " "
  @b4 = " "
  @b5 = " "
  @b6 = " "
  @c1 = " "
  @c2 = " "
  @c3 = " "
  @c4 = " "
  @c5 = " "
  @c6 = " "
  @d1 = " "
  @d2 = " "
  @d3 = " "
  @d4 = " "
  @d5 = " "
  @d6 = " "
  @e1 = " "
  @e2 = " "
  @e3 = " "
  @e4 = " "
  @e5 = " "
  @e6 = " "
  @f1 = " "
  @f2 = " "
  @f3 = " "
  @f4 = " "
  @f5 = " "
  @f6 = " "
  @g1 = " "
  @g2 = " "
  @g3 = " "
  @g4 = " "
  @g5 = " "
  @g6 = " "
end

run_game