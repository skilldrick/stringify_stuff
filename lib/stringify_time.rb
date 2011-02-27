module StringifyTime
  def stringify_time *names
    names.each do |name|
      define_method "#{name}_string" do
        read_attribute(name) &&
          read_attribute(name).strftime("%e %b %Y").strip()
      end

      define_method "#{name}_string=" do |time_str|
        begin
          if time_str.empty?
            parsed = nil
          else
            parsed = Time.zone.parse(time_str)
            raise ArgumentError if parsed.nil?
          end
          write_attribute(name, parsed)
        rescue ArgumentError
          instance_variable_set("@#{name}_invalid", true)
        end
      end
    end

    define_method "time_strings_valid?" do
      names.each do |name|
        if instance_variable_get("@#{name}_invalid")
          errors.add(name, "must be valid date")
        end
      end
    end
  end
end
