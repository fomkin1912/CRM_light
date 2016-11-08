module Filterable

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def filter(filtering_params)
    	results = self.where(nil)
    	filtering_params.each do |key, value|
    		results = results.public_send(key.to_sym, value) if value.present?
      end
      results
    end
  end
end