require "colorize"
require "pry"

@answers = ["Yes", "No", "Maybe", "Why are you asking me?", "It is Certain", "As I see it, yes", "I wouldn't count on it", "Most Likely", "Ask again later", "My reply is no", "Without a doubt", "Signs point to yes", "Very doubtful"]

def split
    puts "🔮 🔮 🔮 🔮 🔮 🔮 🔮 🔮 🔮"
end

def question
    split
    puts "Welcome to the Magic 8 ball".colorize(:magenta)
    split
    puts " "
    puts "Type a question to recieve an answer, you may leave anytime by typing 'Exit'".colorize(:magenta)
    @user_question = gets.to_s
    case @user_question
    when @user_question == "exit"
        puts "Thank you stranger!"
        exit
    when @user_question == "Exit"
        puts "Thank you stranger!"
        exit 
    when @user_question == "add answer"
        add_answer
    else
        answer
    end
end

def answer
    reply = @answers.sample
    puts "The Magic 8 Ball says: #{reply}".colorize(:blue)
    sleep(3)
    print `clear`
    question  
end

def add_answer
    puts "What would you like to add?"
    new_answer = gets.to_s
    @answers << new_answer
end

question