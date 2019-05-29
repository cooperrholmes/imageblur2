class Image

  def initialize (image)
    @image = image
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur
    blur_positions = []

    @image.each_with_index do |row, index|
      row.each_with_index do |position, inner_index|
        if position == 1
          blur_positions << [index, inner_index]
        end
      end
    end

    blur_positions.each do |indexes|
      #Blur Right
      if indexes.last < @image.first.length - 1
        @image[indexes.first][indexes.last+1] = 1
      end
      # #Blur Left
      if indexes.last != 0
        @image[indexes.first][indexes.last-1] = 1
      end

       #Blur Up
      if indexes.first != 0 
        @image[indexes.first-1][indexes.last] = 1
      end

       #Blur Down
      if indexes.first < @image.length - 1
        @image[indexes.first+1][indexes.last] = 1
      end

    end
    output_image
  end
end

image = Image.new([
  [1, 0, 0, 0, 0, 1], 
  [0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 1]
])

image.blur
