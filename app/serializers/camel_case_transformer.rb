# frozen_string_literal: true

class CamelCaseTransformer < Blueprinter::Transformer
  def transform(hash, object, options)
    hash.deep_transform_keys! { |key| key.to_s.camelize(:lower).to_sym }
  end

  class << self
    def deserialize_camel_case(camel_case_hash)
      camel_case_hash.deep_transform_keys! { |key| key.to_s.underscore.to_sym }
    end

    def serialize_camel_case(underscore_hash)
      underscore_hash.deep_transform_keys! { |key| key.to_s.camelize(:lower).to_sym }
    end
  end
end
