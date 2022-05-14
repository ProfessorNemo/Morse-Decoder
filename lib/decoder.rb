require_relative 'morse'

class Decoder
  include Morse
  def initialize(decod)
    @message = decod[:message]
    @language = decod[:language]
  end

  def get_letter(letter)
    raise 'Language defined incorrectly 😱' if !keys_en.include?(letter) & !keys_ru.include?(letter)

    @language == true ? EN_DICTIONARY.invert[letter] : RU_DICTIONARY.invert[letter]
  end

  def decode_word(word)
    @letters = word.split(' ')
    @current_word = ''
    @letters.each do |letter|
      get_letter(letter)
      @current_word += get_letter(letter)
    end
    print "#{@current_word} "
  end

  def decode_message
    @words = @message.split('       ')
    @words.each do |word|
      decode_word(word)
    end
  end
end
