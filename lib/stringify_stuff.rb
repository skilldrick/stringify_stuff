module StringifyStuff
  def stringify_stuff
    class_variable_set("@@json_methods", [])

    define_method "as_json" do |options={}|
      options ||= {}
      options[:methods] ||= []
      options[:methods].concat self.class.send(:class_variable_get, "@@json_methods")
      super(options)
    end
  end

end
