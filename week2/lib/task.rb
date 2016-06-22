class Task
    attr_reader :content, :id, :created_at, :updated_at
    attr_writer :created_at, :content
    @@current_id = 1
    def initialize(content,complete_status = false)
        @content = content
        @id = @@current_id
        @complete_status = complete_status
        @@current_id += 1
        @created_at = Time.new
        @updated_at = nil
    end

    def completed? 
      @complete_status
    end

    def complete!
      @complete_status = true
    end

    def make_incomplete!
      @complete_status = false
    end

    def update_content! input
      @updated_at = Time.new
      @content = input
    end
    def self.current_id= input
      @@current_id = input
    end

end
