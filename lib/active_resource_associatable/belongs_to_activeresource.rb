module AssociationBuilder

  class BelongsToActiveResource

    def self.build(model, klass_name, scope, options, &block)
      #TODO: Needs to modify the code
      model.class_eval do 
        define_method("#{klass_name.to_s.downcase}") do
          if self.is_a?(ActiveResource::Base)
            klass_name.to_s.classify.constantize.find(self.id)
          else
            klass_name.to_s.classify.constantize.find("#{self.send(klass_name.to_s + '_id')}") if "#{self.send(klass_name.to_s + '_id')}".present?
          end
        end
      end
    end

  end
  
end
