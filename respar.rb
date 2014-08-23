START = 1
TRANSCRIPT = 2
TIMING = 3

class String
  def backspace_simplify
    s = self
    while s.include? "\b"
      s = s.gsub(/[^\b][\b]/,'')
    end
    return s
  end
  def hexify
    temp = ''
    self.each_char.with_index(1) {|c, i| temp.concat("#{i}=0x#{c.ord.to_s(16)} ")}
    return temp
    #return self.gsub(/./) { |s| s.ord.to_s(16) + ' ' }
  end
end

puts 'Command line arguments:'
puts ARGV

transcript = ''
#transcript = '  '  # chapuuuuuuuuuuuuuuuuuuuuuuuza
timing = ''

running_clock = 0
running_char_count = 0
time_array = []
interval_array = [0]
sum_array = [0]
repeat_array = [0,0]

state = START
ARGF.readlines.each do |line|
  if line.include? 'Script started on'
    puts line
  elsif line.include? 'Script done on'
    puts line
  elsif line.include? '### transcript'
    puts line
    state = TRANSCRIPT
  elsif line.include? '### timing'
    puts line
    state = TIMING
  else 
    sim = line.backspace_simplify
    simplification = (line.length.to_s == sim.length.to_s ? "none" : "ZONK")
    #puts "#{state} #{simplification}  >>#{line.strip}<< #{line.length.to_s}  >>#{sim.strip}<< #{sim.length.to_s}  #{line.hexify.strip}"

    if state == TRANSCRIPT 
      puts "#{line.hexify.strip}"
      transcript.concat(line)
    elsif state == TIMING
      t = line.split(' ')
      interval = t.first.to_f
      repeat = t.last.to_i
      interval_array.push(interval)
      repeat_array.push(repeat)
      sum_array.push(sum_array.last + interval)

      running_clock += t.first.to_f
      running_char_count += t.last.to_i
      #for index in 1..(t.last.to_i)
      #  time_array.push(running_clock)
      #end
    else
      puts 'blank'
    end

  end 
end

sum_array.push(sum_array.last)  # chauza?

repeat_array.each.with_index do |rep, i| 
  for index in 0..(rep-1)
    time_array.push(sum_array[i])
  end
end

puts

repeat_array.each.with_index {|rep, i| puts "#{i} #{interval_array[i]} #{repeat_array[i]} #{sum_array[i]}"}

#timing.each_line.with_index {|timline, i| puts "#{timline} #{i}"}
#time_array.each.with_index {|t, i| puts "#{t} #{i}"}
transcript.each_char.with_index {|c, i| puts "#{i} #{time_array[i]} #{c.ord.to_s(16)} #{c.strip}"}

puts "transcript length #{transcript.length}"

#puts interval_array
#puts time_array
#puts sum_array
#puts repeat_array

