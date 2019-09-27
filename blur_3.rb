class Image

  def initialize (pic)
    @pic = pic
  end

  def find_ones
    ones = []
  
    @pic.each.with_index do |row, row_number|
      row.each.with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end
  
  def blur(blur_distance)
    ones = find_ones
    
    @pic.each.with_index do |row, row_number|
      row.each.with_index do |item, col_number|
        ones.each do |calc_row_number, calc_col_number|
          if manhattan_distance(col_number, row_number, calc_col_number, calc_row_number) <= blur_distance
            @pic[row_number][col_number] = 1
          end
        end
      end
    end
  end
  
  def manhattan_distance (x1, y1, x2, y2)
    horiz_distance = (x2 - x1).abs
    vert_distance = (y2 - y1).abs
    horiz_distance + vert_distance
  end


  def output_image
    @pic.each do |n|
      puts n.join
    end
  end
end

# input

image = Image.new([
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 1, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1],
[0, 1, 0, 1, 1, 0],
[1, 0, 0, 0, 0, 0],
[1, 1, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 0],
[1, 1, 1, 1, 1, 1]
])

#original output
puts "ORIGINAL IMAGE"
image.output_image

#blurred output
puts
image.blur(2)
puts "BLURRED IMAGE"
image.output_image