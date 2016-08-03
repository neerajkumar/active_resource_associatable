module AssociationBuilder

  class HasOneActiveResource

    def self.build(model, klass_name, scope, options)
      klass_name = options[:class_name] || klass_name
      model.class_eval do 
        define_method("#{klass_name.to_s.downcase}") do
          klass_name.to_s.classify.constantize.find("#{self.send(klass_name.to_s + '_id')}")
        end
      end
    end

  end

end
