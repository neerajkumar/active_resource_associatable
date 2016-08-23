module AssociationBuilder

  class BelongsToActiveResource

    def self.build(model, table_name, options)
      klass_name = options[:class_name] || table_name
      model.class_eval do 
        define_method("#{table_name.to_s.downcase}") do
          klass_name.to_s.classify.constantize.find("#{self.send(table_name.to_s + '_id')}") if "#{self.send(table_name.to_s + '_id')}".present?
        end
      end
    end

  end
  
end
