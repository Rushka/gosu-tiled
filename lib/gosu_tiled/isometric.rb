module Gosu
  module Tiled
    class Isometric < Layer
      def draw_tiles(x, y, tilesets)
        off_x = offset_x_in_tiles(x)
        off_y = offset_y_in_tiles(y)

        tile_range_x = 0..99
        tile_range_y = 0..99

        tile_range_x.each do |xx|
          tile_range_y.each do |yy|
            target_x = transpose_tile_x(xx, yy, x)
            target_y = transpose_tile_y(xx, yy, y)

            # if within_map_range(x + target_x, y + target_y)
              tilesets.get(tile_at(xx, yy)).draw(target_x, target_y, 0)
            # end
          end
        end
      end

      def transpose_tile_x(x, y, off_x)  
        (x - y)*(tile_width/2) + off_x
      end

      def transpose_tile_y(x, y, off_y)
        (x + y)*(tile_height/2) - off_y
      end

      def within_map_range(x, y)
        #(0..map_width - 1).include?(x*2) && (0..map_height - 1).include?(y*2)
        true
      end

      def within_screen_range(x, y)
        range_x = (x - tile_width..@window.width + x + tile_width)
        range_y = (y..@window.height + y + tile_height)
        range_x.include?(x) && range_y.include?(y)
      end

      def map_to_iso(x, y)
        
      end

      def iso_to_map(x, y)
        
      end
    end
  end
end