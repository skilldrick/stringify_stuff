module StringifyPercentage
  def stringify_percentage *names
    names.each do |name|
      methods << "#{name}_string"

      define_method "#{name}_string" do
        send(name) && "#{sprintf "%.2f" % (send(name) * 100)}%"
      end

    end

    define_method "percentage_strings_valid?" do
      names.each do |name|
        if instance_variable_get("@#{name}_invalid")
          errors.add(name, "must be valid percentage")
        end
      end
    end
  end
end
