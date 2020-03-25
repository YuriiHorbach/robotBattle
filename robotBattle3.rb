@robotLifeVal = 100
@arr1 = Array.new(10,@robotLifeVal)
@arr2 = Array.new(10,@robotLifeVal)


def atack2 arr
  i = rand(0..9)
  randLifeTake = rand(30..100)
  arr[i] = arr[i] - randLifeTake
  if arr[i] <= 0
     arr[i] = 0
     puts "Robot with number #{i+1} terminated"
  else
    puts "Missed in number #{i+1}"
  end
end



def victory?
    leftInTeam1 = @arr1.count{|x| x > 0}
    leftInTeam2 = @arr2.count{|x| x > 0}

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

def countRobotWithLife arr
  arr.each do |i|
    if i > 0
      puts i
    end
  end
end
############################# try to findout how to output index number of array element
def getIndex arr
  arr2 = []
  arr.each do |i|
    if i > 0
      arr2 << arr[i]
    end
  end

  puts arr2

end
#############################

def stats
  x = @arr1.count{|x| x > 0}
  y = @arr2.count{|x| x > 0}
  # if x > 0
    puts "1 team has #{x} robots: #{@arr1}"
    getIndex @arr1
    countRobotWithLife @arr1
  # else
  #   print "1 team has 0 robots."
  # end

  puts

  # if y > 0
    puts "2 team has #{y} robots: #{@arr2}"
    getIndex @arr2
    countRobotWithLife @arr2
  # else
    # print "2 team has 0 robots."
  # end


end

loop do
    puts "2d team atack"

    atack2 @arr1
    stats

    exit if victory?

    puts

    puts "1st team atack"
    atack2 @arr2
    stats

    exit if victory?

    puts

end
