class Image

  def initialize (pic)
    @pic = pic
  end

  def output_image
    @pic.each do |n|
      puts n.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image