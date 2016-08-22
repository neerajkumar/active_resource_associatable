module AssociationBuilder

  class HasAndBelongsToManyActiveResources

    def self.build(model, table_name, options)
      klass_name = options[:class_name] || table_name
      model.class_eval do
        define_method(klass_name) do
          sql_query = "select #{klass_name.to_s.singularize}_id from #{[self.class.to_s.gsub('Resource', '').tableize, klass_name.to_s.gsub('_resources', '')].sort.join('_')} where #{self.class.to_s.tableize.gsub('_resources', '').singularize}_id=#{self.id}"
          if self.is_a?(ActiveResource::Base)
            results = ActiveRecord::Base.connection.execute(sql_query)
            resource_id = results.present? ? results[0]["#{klass_name.to_s.singularize}_id"] : nil
            results.present? ? klass_name.to_s.classify.constantize.where(id: resource_id) : []
          else
            results = ActiveRecord::Base.connection.execute(sql_query)
            resource_id = results.present? ? results[0]["#{klass_name.to_s.singularize}_id"] : nil

            klass_name.to_s.classify.constantize.find(:all, params: { id: resource_id})
          end
        end
      end
    end

  end

end
