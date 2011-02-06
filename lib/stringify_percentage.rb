module StringifyPercentage
  def stringify_percentage *names
    methods = class_variable_get("@@json_methods")

    names.each do |name|
      methods << "#{name}_string"

      define_method "#{name}_string" do
        send(name) && "#{sprintf "%.2f" % (send(name) * 100)}%"
      end

    end

    class_variable_set("@@json_methods", methods)
  end
end
