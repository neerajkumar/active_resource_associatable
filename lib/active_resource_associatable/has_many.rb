module AssociationBuilder

  class HasMany

    def self.build(table_name, scope, options, &block)
      klass_name = options[:class_name] || table_name
      puts self.inspect
      self.class_eval do
        define_method(table_name) do
          klass_name.to_s.classify.constantize.where("#{self.class.to_s.tableize.singularize.gsub('_resources', '')}_id=#{self.id}")
        end
      end
    end

  end
  
end
