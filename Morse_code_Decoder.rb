# программа по дешифровке и зашифровке в азбуку Морзе
require_relative 'lib/encrypt'
require_relative 'lib/decoder'

# установите детектор языка
# https://github.com/nashby/wtf_lang
require 'wtf_lang'

WtfLang::API.key = '0cb55dd4cc971ec3132e94d1e1760f92' # you can get it here http://detectlanguage.com/

# Введите фразу на русском или английском языке:
phrase = $stdin.gets.chomp
phrase = phrase.upcase.gsub(/\Ё+/, 'Е')

# перевод фразы в азбуку Морзе (зашифровка)
code = Encrypt.new(phrase).decode
puts code

# дешифровка
if phrase.en?
  Decoder.new(message: code,
              language: true).decode_message
else
  Decoder.new(message: code,
              language: false).decode_message
end
