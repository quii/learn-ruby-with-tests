class Greeter
  @greetings = {
    :English => "Hello",
    :Spanish => "Hola",
    :French => "Bonjour"
  }

  def self.greetings
    @greetings
  end

  def greet(name = "World", language = :English)
    "#{Greeter.greetings[language]}, #{name}!"
  end
end

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