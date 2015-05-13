module Gosu
  module Tiled
    class Layers
      include Enumerable
      def initialize(window, data, orientation, options)
        @window = window
        @layers = data.map do |layer|
          entity_init(orientation).new(window, layer, options)
        end
      end

      def tile
        @layers.select { |l| l.type == 'tilelayer' }.select(&:visible?)
      end

      def object
        @layers.select { |l| l.type == 'objectgroup' }.select(&:visible?)
      end

      def size
        @layers.size
      end

      def each(&block)
        @layers.each do |layer|
          if block_given?
            block.call(layer)
          else
            yield layer
          end
        end
      end

      def entity_init(orientation)
        if orientation == 'isometric'
          Isometric
        else
          Layer
        end
      end
    end
  end
end
