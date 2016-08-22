module AssociationBuilder

  class HasManyActiveResources

    def self.build(model, table_name, options)
      klass_name = options[:class_name] || table_name
      model.class_eval do
        define_method(table_name) do
          foreign_key = options[:foreign_key] || "#{self.class.to_s.tableize.gsub('_resources', '').singularize}_id"
          if self.is_a?(ActiveResource::Base)
            klass_name.to_s.classify.constantize.where("#{foreign_key}": "#{self.id}")
          elsif self.is_a?(ActiveRecord::Base)
            [klass_name.to_s.classify.constantize.find(:all, params: { "#{foreign_key}": self.id})]
          end
        end
      end
    end

  end
  
end
