module Greeter2
  GREETINGS = {
    :English => "Hello",
    :Spanish => "Hola",
    :French => "Bonjour"
  }

  def self.greet(name = "World", language = :English)
    if name.nil?
      name = "World"
    end
    if language.nil?
      language = :English
    end
    "#{GREETINGS[language]}, #{name}!"
  end
end