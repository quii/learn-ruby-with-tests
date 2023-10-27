module Greeter2
  GREETINGS = {
    :English => "Hello",
    :Spanish => "Hola",
    :French => "Bonjour"
  }

  def self.greet(name = "World", language = :English)
    "#{GREETINGS[language]}, #{name}!"
  end
end