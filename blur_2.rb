class Image

  def initialize (pic)
    @pic = pic
  end

  # Transform the image
  
  # Need to find the 1s in the arrays
  def find_ones
    #add an empty array for all the 1s positions
    ones = []
    # look at each row and column
    @pic.each.with_index do |row, row_number|
      row.each.with_index do |item, col_number|
        # if there is a 1 add the row number and column number to the array ones
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end
  # do the blurring - each pixel above, below, right, and left needs to change to 1. 
  def blur
      #define the variable ones with the information from find_ones
      ones = find_ones
      #look at each array again but this time adding the ones as calc number to do if statement
        @pic.each.with_index do |row, row_number|
          row.each.with_index do |item, col_number|
            ones.each do |calc_row_number, calc_col_number|

              if row_number == calc_row_number && col_number == calc_col_number
                #transform the zeros to ones
                @pic[row_number -1][col_number] = 1 unless row_number == 0 #up
                @pic[row_number +1][col_number] = 1 unless row_number >= 3 #down
                @pic[row_number][col_number -1] = 1 unless col_number == 0 #left
                @pic[row_number][col_number +1] = 1 unless col_number >= 3 #right
              end
            end
          end
        end
    end
#output the image
  def output_image
    @pic.each do |n|
      puts n.join
    end
  end
end

# input

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

#original output
puts "ORIGINAL IMAGE"
image.output_image


#blurred output
puts
image.blur
puts "BLURRED IMAGE"
image.output_image