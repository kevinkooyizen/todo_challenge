# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'

# Your Code begins from this line onwards #

input = ARGV
def list 
  a = Task.all
  puts "No".ljust(4)+ "Description".ljust(15) + "Status".ljust(15)
  puts "===".ljust(4) + "============".ljust(15) + "======".ljust(15)

  # each_with_index will assign an index to each element starting from 0
  a.each_with_index do |x, index|
    
    # string.gsub(/\S+/, &:capitalize) <<-- this capitalizes all the words in the string.
    puts "#{index + 1}.".ljust(4) + "#{x.description.gsub(/\S+/, &:capitalize)}".ljust(15) + "#{x.status.gsub(/\S+/, &:capitalize)}".ljust(15)
   
  end
  
end

def add(description, status)
  Task.create(description: description, status: status)
end


def update(id, description, status)
  if (Task.count < id)
    puts "Task number #{id} is not found. Are you sure that this is the right task number?"
  else
    task = Task.first(id).last
    task.description = description
    task.status = status

    task.save
  end
end

def delete(id)
  if (Task.count < id)
    puts "Task number #{id} is not found. Are you sure that this is the right task number?"
  else
    task = Task.first(id).last
    task.destroy
  end
end

if ARGV[0] == "--list"
 list
elsif ARGV[0] == "--add"
  add(ARGV[1],ARGV[2])
elsif ARGV[0] == "--remove"
  delete(ARGV[1].to_i)
elsif ARGV[0] == "--update"
  update(ARGV[1].to_i,ARGV[2],ARGV[3])
end