require "colorize"
require "pry"

@answers = ["Yes", "No", "Maybe", "Why are you asking me?", "It is Certain", "As I see it, yes", "I wouldn't count on it", "Most Likely", "Ask again later", "My reply is no", "Without a doubt", "Signs point to yes", "Very doubtful"]
@more_answers = @answers.clone

def split
    puts "🔮 🔮 🔮 🔮 🔮 🔮 🔮 🔮 🔮"
end

def question
    split
    puts "Welcome to the Magic 8 ball".colorize(:magenta)
    split
    puts " "
    puts "Type a question to recieve an answer, you may leave anytime by typing 'Exit'".colorize(:magenta)
   
    user_question = gets.strip.to_s
    
    case user_question
    when "exit"
        puts "Thank you stranger!".colorize(:red)
        exit 
    when "Exit"
        puts "Thank you stranger!".colorize(:red)
        exit 
    when "add answer"
        add_answer
    when "answers"
        display_all
    when "reset"
        reset
    else
        answer
    end
end

def answer
    reply = @answers.sample
    puts "The Magic 8 Ball says: #{reply}".colorize(:cyan)
    sleep(3)
    print `clear`
    question  
end

def add_answer
    puts "What would you like to add?".colorize(:cyan)
    new_answer = gets.to_s.strip
    @more_answers << new_answer
    question
end

def display_all
    @more_answers.each{ |answer| puts answer.colorize(:green)}
    sleep(3)
    print `clear`
    question
end

def reset
    @more_answers = @answers
    print `clear`
    question
end

question