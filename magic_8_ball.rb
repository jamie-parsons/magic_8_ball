# Basic Objectives:
#
# - User inputs question
# - Computer outputs random answer
# - User inputs "QUIT"
# - Computer outputs a goodbye message and exits

# #- ability to add more answers:
# - via easter egg question ("add_answers")
# - do not let them add the same answer if the eight ball already has that answer

@answer = [ "It is certain", "It is decidedly so", "Without a doubt", "Yes definitely",
  "You may rely on it", "Most likely", "Outlook good", "Yes", "Signs point to yes",
  "Ask again later", "Don't count on it", "Outlook not so good", "Very Doubtful" ]

def query
  puts "What do you want to ask? Or type quit."
  print "> "
  command = gets.strip.downcase
    if command == "quit"
      quit
    elsif command == "list" #showing response
      print_answers
    elsif command == "what is the meaning of life?"
      puts "42"
      if @answer.include? "42"
      puts "Is that right?"
      print "> "
      reply
      else
      @answer << "42"
      puts "Is that right?"
      print "> "
      reply
      end
    end
  random
end

# How to compare string with either upper or lowercase? e.g. "Ask again later" does
# not match "ask again later"
def reply
  user_reply = gets.strip
  if @answer.include? user_reply
    query
  else
    @answer << user_reply.to_s
  end
  query
end

def print_answers
  @answer.each do |responses|
    puts responses
  end
  query
end

def random
  puts @answer.sample
  query
end

def quit
  puts "Goodbye!"
  exit
end

query
