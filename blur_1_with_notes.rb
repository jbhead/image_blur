# define the class
class Image
# initialize and store as an @pic
    def initialize (pic)
      @pic = pic
    end

# gather the various arrays input by Image.new and combine them

  def output_image
    @pic.each do |n|
      puts n.join
    end
  end
end
# print the image to the screen
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image
