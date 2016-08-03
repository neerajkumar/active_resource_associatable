require_relative "./has_many_activeresources"
require_relative "./belongs_to_activeresource"


module ActiveResourceAssociatable
  extend ActiveSupport::Concern

  module ClassMethods
    def has_many_activeresources(table_name, scope = nil, options = {}, &extension)
      AssociationBuilder::HasManyActiveResources.build(self, table_name, scope, options, &extension)
    end

    def belongs_to_activeresource(klass_name, scope = nil, options = {})
      AssociationBuilder::BelongsToActiveResource.build(self, klass_name, scope, options)
    end
  end
  
  def has_and_belongs_to_many_activeresources(table_name, options={})
    if !options[:class_name].present?
      self.class_eval do
        define_method(table_name) do
          self.set_uid if self.respond_to?(:set_uid)
          sql_query = "select #{table_name.to_s.singularize}_id from #{[self.class.to_s.gsub('Resource', '').tableize, table_name.to_s.gsub('_resources', '')].sort.join('_')} where #{self.class.to_s.tableize.gsub('_resources', '').singularize}_id=#{self.id}"
          results = ActiveRecord::Base.establish_connection(Rails.env.to_sym).connection.execute(sql_query).to_a.flatten
          if self.is_a?(ActiveResource::Base)
            table_name.to_s.classify.constantize.where(id: results)
          else
            ("#{table_name.to_s.classify}Resource").constantize.find(:all, params:{id: results})
          end
        end
      end
    end
  end

  def has_one_activeresource(klass_name, options={})
    if !options[:class_name].present?
      define_method("#{klass_name.to_s.downcase}") do
        ("#{klass_name.to_s}_resource").classify.constantize.find("#{self.send(klass_name.to_s + '_id')}")
      end
    end
  end

end
