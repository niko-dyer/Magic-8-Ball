require "colorize"
require "pry"

@answers = ["Yes", "No", "Maybe", "Why are you asking me?", "It is Certain", "As I see it, yes", "I wouldn't count on it", "Most Likely", "Ask again later", "My reply is no", "Without a doubt", "Signs point to yes", "Very doubtful", "That's a stupid question"]
@more_answers = @answers.clone
@easter = ["Display answers", "Add answers", "Reset answers", "Back to game"]

def split
    puts "🔮 🔮 🔮 🔮 🔮 🔮 🔮 🔮 🔮"
end

def question
    split
    puts "Welcome to the Magic 8 ball".colorize(:magenta)
    split
    puts " "
    puts "Type a question to recieve an answer, you may leave anytime by typing 'Exit'".colorize(:light_red)
   
    user_question = gets.strip.to_s
    
    case user_question 
    when "easter eggs"
        print `clear`
        easter_eggs
    when "exit"
        puts "Thank you stranger!".colorize(:red)
        exit
    when "Exit"
        puts "Thank you stranger!".colorize(:red)
        exit
    else 
        answer
    end
end

def answer
    reply = @more_answers.sample
    puts "The Magic 8 Ball says: #{reply}".colorize(:cyan)
    sleep(3)
    print `clear`
    question  
end

def add_answer
    puts "What would you like to add?".colorize(:cyan)
    new_answer = gets.to_s.strip
    @more_answers << new_answer
    puts "#{new_answer} has been added".colorize(:green)
    sleep(2)
    print `clear`
    easter_eggs
end

def display_all
    @more_answers.each{ |answer| puts answer.colorize(:light_green)}
    sleep(3)
    print `clear`
    easter_eggs
end

def easter_eggs
    puts "Welcome to the easter eggs, please select from the following".colorize(:light_blue)
    list(@easter)
    choice = gets.to_i
    case choice
    when 1 
        display_all
    when 2
        add_answer
    when 3
        reset
    when 4
        print `clear`
        question
    else
        puts "Invalid choice. Please try again"
        easter_eggs
    end
end

def list(eggs)
    puts "What do you want?"
    eggs.each_with_index do |egg, index|
        puts "#{index + 1}) #{egg}".colorize(:magenta)
    end
end

def reset
    @more_answers = @answers
    puts "Answers have been reset".colorize(:blue)
    sleep(2)
    print `clear`
    easter_eggs
end

question