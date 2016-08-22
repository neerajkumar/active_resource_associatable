module AssociationBuilder

  class BelongsToActiveResource

    def self.build(model, klass_name, options)
      klass_name = options[:class_name] || klass_name
      model.class_eval do 
        define_method("#{klass_name.to_s.downcase}") do
          klass_name.to_s.classify.constantize.find("#{self.send(klass_name.to_s + '_id')}") if "#{self.send(klass_name.to_s + '_id')}".present?
        end
      end
    end

  end
  
end
