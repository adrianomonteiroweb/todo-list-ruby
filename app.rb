require_relative 'task'
require_relative 'task_manager'
require_relative 'data_store'

manager = TaskManager.new
manager.loading_tasks

loop do
  puts "Choose an option:"
  puts "1. Add a new task"
  puts "2. List all tasks"
  puts "3. Define task as completed"
  puts "4. Remove a task"
  puts "5. Exit"

  option = gets.chomp.to_i

  case option
  when 1
    print "Digit the title of the task: "
    title = gets.chomp
    print "Digit the description of the task: "
    description = gets.chomp
    task = manager.add_task(title, description)
    puts "Task added: #{task}"
  when 2
    puts "Tasks:"
    manager.list_tasks.each { |task| puts task }
  when 3
    print "Digit the ID of the task that you want to mark as completed: "
    id = gets.chomp.to_i
    manager.define_success(id)
    puts "Task marked as completed!"
  when 4
    print "Digit the ID of the task that you want to remove: "
    id = gets.chomp.to_i
    manager.remove_task(id)
    puts "Task removed!"
  when 5
    manager.salve_tasks
    puts "Exiting..."
    break
  else
    puts "Invalid option."
  end
end
