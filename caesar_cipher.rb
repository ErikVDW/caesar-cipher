def encrypt string, shift
  if shift > 25
    raise Exception.new('Shift should logically be less than 26.')
  end
  char_arr = string.split('') # char_arr = ['A' ,' ', 's', 'e', 'n', 't', 'e', 'n', 'c', 'e','.']
  char_arr.map do |char|
    char = char.ord # ASCII numberic
    if char >= 97 && char + shift <= 122 || char >= 65 && char + shift <= 90 # Char will not shift out of its alphabet
      char += shift
    elsif char >= 97 && char <= 122 # Lowercase char shifts out of alphabet
      # Shift the character the remainder over only
      over = (char + shift) % 122 
      char = over + 96
    elsif char >= 65 && char <= 90 # Uppercase char shifts out of alphabet
      # Shift the character the remainder over only
      over = (char + shift) % 90
      char = over + 64
    end
    char = char.chr # Back to readable characters
  end.join("")
end

# Decryption can be done by shifting again by the remainder of characters
def decrypt string, shift
  encrypt string, 26 - shift 
end