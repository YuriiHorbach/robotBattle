#add arrays
@arr1 = Array.new(10,1)
@arr2 = Array.new(10,1)

#attack
def attack arr
    i = rand(0..9)
    if arr[i] == 1
      arr[i] = 0
      puts "Robot with index #{i} terminated"
    else
      puts "Missed!"
    end
end


#check victory
def check_victory?
  team1 = @arr1.count{|x| x == 1}
  team2 = @arr2.count{|x| x == 1}

  if team1 == 0
    if team2 == 1
      puts "#Team 2 won. There is #{team2} live robot"
    else
      puts "#Team 2 won. There is #{team2} live robots"
    end
    return true
  end


  if team2 == 0
    if team1 == 1
      puts "Team 1 won. There is #{team1} live robot"
    else
      puts "Team 1 won. There is #{team1} live robots"
    end
    return true
  end

end


check_victory?
#statistic

def statistic
  statTeam1 = @arr1.count{|x| x == 1}
  statTeam2 = @arr2.count{|x| x == 1}
  puts "Team 1 has #{statTeam1} robots"
  puts "Team 2 has #{statTeam2} robots"
end
#main loop

loop do
  puts "1st team attack"
  attack @arr2
  exit if check_victory?
  statistic
  puts

  puts "2st team attack"
  attack @arr1
  exit if check_victory?
  statistic
  puts
end
