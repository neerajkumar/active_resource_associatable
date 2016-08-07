require_relative "./has_many_activeresources"
require_relative "./belongs_to_activeresource"
require_relative "./has_and_belongs_to_many_activeresources"
require_relative "./has_one_activeresource"

module ActiveResourceAssociatable
  extend ActiveSupport::Concern

  module ClassMethods
    def has_many_activeresources(table_name, options = {})
      AssociationBuilder::HasManyActiveResources.build(self, table_name, options)
    end

    def belongs_to_activeresource(klass_name, options = {})
      AssociationBuilder::BelongsToActiveResource.build(self, klass_name, options)
    end

    def has_and_belongs_to_many_activeresources(klass_name, options = {})
      AssociationBuilder::HasAndBelongsToManyActiveResources.build(self, klass_name, options)
    end

    def has_one_activeresource(klass_name, options={})
      AssociationBuilder::HasOneActiveResource.build(self, klass_name, options)
    end
  end

end
