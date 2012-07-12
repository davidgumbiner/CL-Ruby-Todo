require "csv"

#tlist.csv = CSV file
#tlist = writing to CSV file
#current_list = array version of CSV

  #print instructions
  if ARGV[0] == nil
    puts "Usage: 
    all: view all incomplete todos
    new <description>: create a new todo item
    complete <id>: mark the todo item as completed"
  end


  #view all incomplete todos
  if ARGV[0] == "all"
  current_list = CSV.read("tlist.csv")
  current_list.each_with_index {|row, index| puts "#{index+1}. #{row}"}
  end


  #create a new todo item
  if ARGV[0] == "new"
  
  #create an array and add the new item
  current_list = CSV.read("tlist.csv")
  next_item = ARGV[1]
  current_list << [next_item]
  
  #overwrite file with new array
  tlist = CSV.open('tlist.csv', 'w') 
  current_list.each {|row| tlist << row}
  tlist.close
  
  #print new file
  current_list.each_with_index {|row, index| puts "#{index+1}. #{row}"}
  end


  #mark the todo item as completed
  if ARGV[0] == "complete"
  
  complete_index = (ARGV[1].to_i - 1)
  
  #create an array and delete row
  current_list = CSV.read("tlist.csv")
  current_list.delete_at(complete_index)
  
  #overwrite file with new array
  tlist = CSV.open('tlist.csv', 'w') 
  current_list.each {|row| tlist << row}
  tlist.close
  
  #print new file
  current_list.each_with_index {|row, index| puts "#{index+1}. #{row}"}
  end
