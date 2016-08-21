module AssociationBuilder

  class HasAndBelongsToManyActiveResources

    def self.build(model, table_name, options)
      klass_name = options[:class_name] || table_name
      model.class_eval do
        define_method(klass_name) do
          sql_query = "select #{klass_name.to_s.singularize}_id from #{[self.class.to_s.gsub('Resource', '').tableize, klass_name.to_s.gsub('_resources', '')].sort.join('_')} where #{self.class.to_s.tableize.gsub('_resources', '').singularize}_id=#{self.id}"
          results = model.find_by_sql(sql_query)
          if self.is_a?(ActiveResource::Base)
            klass_name.to_s.classify.constantize.find(:all, params:{id: results})
          else
            klass_name.to_s.classify.constantize.where(id: results)
          end
        end
      end
    end

  end

end
