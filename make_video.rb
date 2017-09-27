require_relative 'constants'

if !Dir.exist? FRAMES_OUTPUT_DIR
  raise "#{FRAMES_OUTPUT_DIR} does not exist."
end

frames = Dir.glob("#{FRAMES_OUTPUT_DIR}/*.jpg")

puts frames.count

`ffmpeg -f image2 -framerate 25 -pattern_type sequence -start_number 1
-r 3 -i %d.jpg -s 640x480 test.avi`
