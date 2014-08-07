require 'yaml'

stuff = YAML.load_file('config.yml')
stuff.each_pair { |k,v| puts "---> #{k.to_s}:#{v.to_s}}" }

puts "--- SF ---"

puts "--- read one ---"
#counter = 1
theses = []
sents = []
begin
  file = File.new("zero.txt", "r")
  while (line = file.gets)
    theses << line.strip
    #counter = counter + 1
  end
  file.close
rescue => err
  puts "Exception reading zero.txt: #{err}"
  err
end

begin
  file = File.new("one.txt", "r")
  while (line = file.gets)
    sents << line.strip
    #counter = counter + 1
  end
  file.close
rescue => err
  puts "Exception reading one.txt: #{err}"
  err
end

puts "--- results ---"
puts theses.inspect
puts sents.inspect

puts "\n"
nbr = Random.rand(100)
#puts "nbr: #{nbr%5}"
#theses_index = theses.length
puts "thesis: #{theses[nbr%(theses.length-1)]}"
puts "\n"