module Sections
  module Generators
    class InstallGenerator < ::Rails::Generators::Base      
      source_root File.expand_path('../../templates', __FILE__)

      def copy_views
        directory "views", "app/views/sections/pages/"
      end
    end
  end
end