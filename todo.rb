require "csv"

#tlist.csv = CSV file
#tlist = writing to CSV file
#current_list = array version of CSV
#current_session = main object of Todo_App class

class Todo_App
  
  def print_list
    #print new file
    if File.exist?("tlist.csv")
      current_list = CSV.read("tlist.csv")
      current_list.each_with_index {|row, index| puts "#{index+1}. #{row[0]}"}
    else
      puts "Try adding something to the list first!"
  end
  end
  
  def overwrite(updated_list)
    #overwrite file with new array
    tlist = CSV.open('tlist.csv', 'w') 
    updated_list.each {|row| tlist << row}
    tlist.close
  end
  
  def all_list
    #view all incomplete todos
    print_list
  end
  
  def new_item
    #create a new todo item
    
    #create an array and add the new item
    
    if File.exist?("tlist.csv")
    next_item = ARGV[1]
    current_list = CSV.read("tlist.csv")
    current_list << [next_item]
    
    overwrite(current_list)
    print_list
    
  else
    
    tlist = CSV.open('tlist.csv', 'w') do |csv|
    csv << [" "]
    tlist.close
  end
    
    next_item = ARGV[1]
    current_list = CSV.read("tlist.csv")
    current_list << [next_item]
    
    overwrite(current_list)
    print_list
  end
  end
  
  def complete
    complete_index = (ARGV[1].to_i - 1)

    #create an array and delete row
    current_list = CSV.read("tlist.csv")
    current_list.delete_at(complete_index)

    overwrite(current_list)
    print_list
  end
  
end

current_session = Todo_App.new

  #print instructions
  if ARGV[0] == nil
    puts "Usage: 
    all: view all incomplete todos
    new <description>: create a new todo item
    complete <id>: mark the todo item as completed"
  end


  #view all incomplete todos
  if ARGV[0] == "all"
    current_session.all_list
  end


  #create a new todo item
  if ARGV[0] == "new"
    current_session.new_item
  end


  #mark the todo item as completed
  if ARGV[0] == "complete"
    current_session.complete
  end