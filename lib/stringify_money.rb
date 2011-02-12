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
          parsed = Float(val.sub('£', '')).round(2)
          send("#{name}=".to_sym, parsed)
        rescue ArgumentError
          instance_variable_set("@#{name}_invalid", true)
        end
      end

      define_method "#{name}_invalid?" do
        instance_variable_get("@#{name}_invalid")
      end
    end
  end
end
