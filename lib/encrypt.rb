# frozen_string_literal: true

require_relative 'morse'

class Encrypt
  include Morse

  def initialize(code)
    @code = code
  end

  def decode_word(word)
    raise 'Language defined incorrectly 😱' if !@code.en? & !@code.ru?

    if @code.en?
      word.chars.map { |letter| EN_DICTIONARY[letter] }.join(' ')
    else
      word.chars.map { |letter| RU_DICTIONARY[letter] }.join(' ')
    end
  end

  def decode
    @code
      .split(/(\d)|(\.)|(\?)|(,)|(!)|(@)|(-)|(')|(:)|(;)|(\()|(\))|(")|\s+/)
      .reject(&:empty?)
      .map { |word| decode_word(word) }
      .join('       ')
  end
end
