class TaskManager
    def initialize
      @tasks = []
      @next_id = 1
    end
  
    def add_task(title, description)
      task = Task.new(@next_id, title, description)
      @tasks << task
      @next_id += 1
      task
    end
  
    def list_tasks
      @tasks
    end
  
    def define_success(id)
      task = @tasks.find { |t| t.id == id }
      task.define_success if task
    end
  
    def remove_task(id)
      @tasks.reject! { |t| t.id == id }
    end
  
    def salve_tasks
      DataStore.salve(@tasks)
    end
  
    def loading_tasks
      @tasks = DataStore.loading
      @next_id = @tasks.empty? ? 1 : @tasks.max_by(&:id).id + 1
    end
  end
  