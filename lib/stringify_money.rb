# coding: utf-8
module StringifyMoney
  def stringify_money *names

    names.each do |name|
      define_method "#{name}_string" do
        send(name) &&
          "£#{sprintf "%.2f" % send(name)}"
      end

      define_method "#{name}_string=" do |val|
        begin
          if val.empty?
            parsed = nil
          else
            parsed = Float(val.sub('£', '')).round(2)
          end
          send("#{name}=".to_sym, parsed)
        rescue ArgumentError
          instance_variable_set("@#{name}_invalid", true)
        end
      end
    end

    define_method "money_strings_valid?" do
      names.each do |name|
        if instance_variable_get("@#{name}_invalid")
          errors.add(name, "must be valid value")
        end
      end
    end
  end
end
