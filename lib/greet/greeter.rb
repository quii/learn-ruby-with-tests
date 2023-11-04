class Greeter
  def greet(name = "World", language = :English)
    if name.nil?
      name = "World"
    end
    if language.nil?
      language = :English
    end
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