# coding: utf-8
module StringifyMoney
  def stringify_money *names
    methods = class_variable_get("@@json_methods")

    names.each do |name|
      methods << "#{name}_string"

      class_variable_set("@@json_methods", methods)

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

    class_variable_set("@@json_methods", methods)
  end
end
