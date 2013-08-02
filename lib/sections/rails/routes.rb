module ActionDispatch::Routing
  class Mapper
    def sections_for(resource_model)
      namespace :sections do
        resources :pages
      end

      Sections.resource_model = resource_model
    end
  end
end