module Ruby4Live
  class LiveObject
    
    attr_accessor :id, :live_set
    
    def initialize(options)
      self.live_set = options[:live_set]
      options.each do |name, value|
        # puts "setting #{name}=#{value}"
        puts "ID CANNOT BE NIL OR ZERO #{self.inspect}" if (name.to_s == 'id' and (value == 0 or value.nil?))
        self.send(name.to_s + '=', value)
      end
      default_properties.map {|p| self.get(p) } unless default_properties.nil?
      after_initialize
    end
    
    def after_initialize
    end
    
    # get default properties from config/settings.rb
    def default_properties
      begin
        SETTINGS[self.class.to_s.downcase]['default_properties']
      rescue
        []
      end
    end
    
    def set_path
      connection.send_message("/set_live_object", "id #{id}", false)
    end
    
    def get(property)
      set_path
      sleep SLEEP_INTERVAL
      self.send(property.to_s + '=', connection.send_message("/live_object", "get #{property}", true)[0][1][1])
    end
    
    def set(property, value)
      set_path
      connection.send_message("/live_object", "set #{property} #{value}", false)
    end
    
    def connection
      live_set.connection
    end
    
  end
end