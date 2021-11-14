# frozen_string_literal: true

require 'ostruct'

module BikeReg
  class Object < OpenStruct
    def initialize(attributes)
      super(to_ostruct(attributes))
    end

    def to_ostruct(obj)
      case obj
      when Hash
        new_obj = obj.transform_keys { |key| underscore(key) }
        OpenStruct.new(new_obj.transform_values { |val| to_ostruct(val) })
      when Array
        obj.map { |o| to_ostruct(o) }
      else # Assumed to be a primitive value
        obj
      end
    end

    private

    def underscore(camel_cased_word)
      return camel_cased_word.to_s unless /[A-Z-]|::/.match?(camel_cased_word)

      word = camel_cased_word.to_s.gsub('::', '/')
      # word.gsub!(inflections.acronyms_underscore_regex) { "#{$1 && '_' }#{$2.downcase}" }
      word.gsub!(/([A-Z]+)(?=[A-Z][a-z])|([a-z\d])(?=[A-Z])/) { (Regexp.last_match(1) || Regexp.last_match(2)) << '_' }
      word.tr!('-', '_')
      word.downcase!
      word
    end
  end
end
