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