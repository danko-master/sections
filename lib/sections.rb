require "sections/version"
require "sections/engine"

module Sections
  def self.resource_model=(resource_model)
    @@resource_model = resource_model.to_s.capitalize
  end

  def self.resource_model
    @@resource_model.to_s.constantize
  end

  def self.resource_params_name
    @@resource_model.downcase
  end
end
