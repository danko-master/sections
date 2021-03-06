require 'rails/generators/active_record'
require 'generators/sections/orm_helpers'

module ActiveRecord
  module Generators
    class SectionsGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      include Sections::Generators::OrmHelpers
      source_root File.expand_path("../templates", __FILE__)

      def copy_sections_migration
        if (behavior == :invoke && model_exists?) || (behavior == :revoke && migration_exists?(table_name))
          migration_template "migration_existing.rb", "db/migrate/add_sections_to_#{table_name}"
        else
          migration_template "migration.rb", "db/migrate/sections_create_#{table_name}"
        end
      end

      def generate_model
        invoke "active_record:model", [name], :migration => false unless model_exists? && behavior == :invoke
      end

      def inject_sections_content
        content = model_contents

        class_path = if namespaced?
          class_name.to_s.split("::")
        else
          [class_name]
        end

        indent_depth = class_path.size - 1
        content = content.split("\n").map { |line| "  " * indent_depth + line } .join("\n") << "\n"

        inject_into_class(model_path, class_path.last, content) if model_exists?
      end

      def migration_data
<<RUBY
      t.string  :name, :null => false, :default => ""
      t.string  :text 
RUBY
      end
    end
  end
end