module AssociationBuilder

  class HasManyThroughActiveResources

    def self.build(model, table_name, options)
      middle_table = options[:through].to_s
      klass_name = table_name.to_s
      model.class_eval do
        define_method(klass_name) do
          if self.is_a?(ActiveResource::Base)
            associated_ids = middle_table.classify.constantize.where("#{model.collection_name.singularize}_id = ?", self.id).pluck("#{klass_name.singularize}_id".to_sym)
            klass_name.classify.constantize.where(id: associated_ids)
          else
            associated_ids = middle_table.classify.constantize.where("#{model.table_name.singularize}_id = ?", self.id).pluck("#{klass_name.singularize}_id".to_sym)
            klass_name.classify.constantize.find(:all, params:{id: associated_ids})
          end
        end
      end
    end

  end

end
