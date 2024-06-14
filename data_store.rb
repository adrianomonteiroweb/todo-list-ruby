require 'json'

class DataStore
  FILE_NAME = 'tasks.json'

  def self.salve(tasks)
    File.write(FILE_NAME, JSON.pretty_generate(tasks.map(&:to_h)))
  end

  def self.loading
    return [] unless File.exist?(FILE_NAME)
    JSON.parse(File.read(FILE_NAME)).map do |task_hash|
      Task.new(task_hash["id"], task_hash["title"], task_hash["description"]).tap do |tarefa|
        tarefa.success = task_hash["success"]
        tarefa.created_date = Time.parse(task_hash["created_date"])
        tarefa.succes_date = task_hash["succes_date"] ? Time.parse(task_hash["succes_date"]) : nil
      end
    end
  end
end
