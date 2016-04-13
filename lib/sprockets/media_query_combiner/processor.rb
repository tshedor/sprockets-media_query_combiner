require 'tilt'
require 'sass/media_query_combiner/combiner'

module Sprockets
  module MediaQueryCombiner
    class Processor < Tilt::Template
      def prepare
      end

      def evaluate(context, locals, &block)
        Sass::MediaQueryCombiner::Combiner.combine(data)
      end

      # Required for Sprockets >= 4
      def self.call(input)
        Sass::MediaQueryCombiner::Combiner.combine(input[:data])
      end
    end
  end
end
