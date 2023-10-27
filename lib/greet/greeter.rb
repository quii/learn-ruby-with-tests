class Greeter
  def greet(name = "World", language = :English)
    "#{get_greeting(language)}, #{name}!"
  end

  private
  def get_greeting(language)
    greetings = {
      :English => "Hello",
      :Spanish => "Hola",
      :French => "Bonjour"
    }
    greetings[language]
  end
end