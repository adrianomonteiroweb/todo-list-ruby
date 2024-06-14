class Task
    attr_accessor :id, :title, :description, :success, :created_date, :succes_date
  
    def initialize(id, title, description = "")
      @id = id
      @title = title
      @description = description
      @success = false
      @created_date = Time.now
      @succes_date = nil
    end
  
    def define_success
      @success = true
      @succes_date = Time.now
    end
  
    def to_s
      status = @success ? "Success" : "Pendding"
      "ID: #{@id} | Title: #{@title} | Description: #{@description} | Status: #{status} | Created at: #{@created_date} | Successed at: #{@succes_date}"
    end
  end
  