module AssociationBuilder

  class HasOneActiveResource

    def self.build(model, table_name, options)
      klass_name = options[:class_name] || table_name
      model.class_eval do 
        define_method("#{table_name.to_s.downcase}") do
          if self.is_a?(ActiveResource::Base)
            klass_name.to_s.classify.constantize.find_by("#{model.element_name}_id": self.id)
          elsif self.is_a?(ActiveRecord::Base)
            klass_name.to_s.classify.constantize.find("#{self.send(table_name.to_s + '_id')}")
          end
        end
      end
    end

  end

end
