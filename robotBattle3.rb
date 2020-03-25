@arr1 = Array.new(10,1)
@arr2 = Array.new(10,1)


def atack arr
  i = rand(0..9)
  if arr[i] == 1
     arr[i] = 0
     puts "Robot with number #{i+1} terminated"
  else
    puts "Missed in number #{i+1}"
  end
end

def victory?
    leftInTeam1 = @arr1.count{|x| x == 1}
    leftInTeam2 = @arr2.count{|x| x == 1}

    if leftInTeam1 == 0
      if leftInTeam2 > 1
        puts "Team 2 is winner. Left #{leftInTeam2} robots"
      else
        puts "Team 2 is winner. Left #{leftInTeam2} robot"
      end
      return true
    end

    if leftInTeam2 == 0
      if leftInTeam1 > 1
        puts "Team 1 is winner. Left #{leftInTeam1} robots"
      else
        puts "Team 1 is winner. Left #{leftInTeam1} robot"
      end
      return true
    end

    false
end

def stats
  x = @arr1.count{|x| x == 1}
  y = @arr2.count{|x| x == 1}
  puts "1st team has #{x} robots: #{@arr1}"
  puts "2st team has #{y} robots: #{@arr2}"
end

loop do
    puts "2d team atack"

    atack @arr1
    stats
    exit if victory?

    puts

    puts "1st team atack"
    atack @arr2
    stats
    exit if victory?

    puts

end
