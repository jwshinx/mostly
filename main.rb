require 'yaml'

# ha
# foo
# bar
# yar
stuff = YAML.load_file('config.yml')
#stuff.each_pair { |k,v| puts "---> #{k.to_s}:#{v.to_s}" }

intros = []
sents = []
begin
  file = File.new("intro.txt", "r")
  while (line = file.gets)
    intros << line.strip
  end
  file.close
rescue => err
  puts "Exception reading intro.txt: #{err}"
  err
end

begin
  file = File.new("item_sentence.txt", "r")
  while (line = file.gets)
    sents << line.strip
  end
  file.close
rescue => err
  puts "Exception reading item_sentence.txt: #{err}"
  err
end

para = []
nbr = Random.rand(100)
intro = intros[nbr%(intros.length-1)]
myintro = intro.gsub('[customer]', stuff['customer']['name'])

para << myintro

def make_sent key, sents, stuff
  nbr = Random.rand(100)
  index = nbr%(sents.length-1)
  puts "---> index: #{index.to_s}"
  sent = sents[index]
  mysent = sent.gsub('[color]', stuff['customer'][key]['color'])
  mysent = mysent.gsub('[item]', stuff['customer'][key]['name'])
  mysent
end

para << make_sent( 'item1', sents, stuff ) if stuff['customer'].has_key?('item1')
para << make_sent( 'item2', sents, stuff ) if stuff['customer'].has_key?('item2')
para << make_sent( 'item3', sents, stuff ) if stuff['customer'].has_key?('item3')
para << make_sent( 'item4', sents, stuff ) if stuff['customer'].has_key?('item4')
para << make_sent( 'item5', sents, stuff ) if stuff['customer'].has_key?('item5')

puts "\n"
puts "\n"
puts "--- results ---"
puts para.join("\n")
puts "\n"
puts "\n"
