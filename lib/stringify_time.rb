module StringifyTime
  def stringify_time *names
    methods = class_variable_get("@@json_methods")

    names.each do |name|
      methods << "#{name}_string"

      define_method "#{name}_string" do
        read_attribute(name) &&
          read_attribute(name).strftime("%e %b %Y").strip()
      end

      define_method "#{name}_string=" do |time_str|
        begin
          parsed = Time.zone.parse(time_str)
          raise ArgumentError if parsed.nil?
          write_attribute(name, parsed)
        rescue ArgumentError
          instance_variable_set("@#{name}_invalid", true)
        end
      end

      define_method "#{name}_invalid?" do
        instance_variable_get("@#{name}_invalid")
      end
    end

    class_variable_set("@@json_methods", methods)
  end
end
