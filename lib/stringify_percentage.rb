module StringifyPercentage
  def stringify_percentage *names
    names.each do |name|
      methods << "#{name}_string"

      define_method "#{name}_string" do
        send(name) && "#{sprintf "%.2f" % (send(name) * 100)}%"
      end

    end
  end
end
