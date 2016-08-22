module AssociationBuilder

  class HasManyActiveResources

    def self.build(model, table_name, options)
      klass_name = options[:class_name] || table_name
      model.class_eval do
        define_method(table_name) do
          if self.is_a?(ActiveResource::Base)
            klass_name.to_s.classify.constantize.where("#{self.class.to_s.tableize.singularize.gsub('_resources', '')}_id=#{self.id}")
          else
            [klass_name.to_s.classify.constantize.find(:all, params: { "#{self.class.to_s.tableize.singularize.gsub('_resources', '')}_id": self.id})]
          end
        end
      end
    end

  end
  
end
