module Paperclip
  class CustomInterpolator
    include Interpolations


    def interpolate pattern, *args
      pattern = args.first.instance.send(pattern) if pattern.kind_of? Symbol
      pattern.gsub(/:([a-z][a-z0-9_]+)/) do |match|
        method_name = $1
        respond_to?(method_name) ? send(method_name, *args) : match
      end
    end

    def plural_cache
      Interpolations.plural_cache
    end
  end
end
