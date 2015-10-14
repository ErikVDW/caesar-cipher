def encrypt string, shift
  if shift > 25
    raise Exception.new('Shift should logically be less than 26.')
  end
  if shift < 1
    raise Exception.new('Unshift must be positive')
  end
  if !shift.is_a?(Integer)
    raise Exception.new('Are you using a non-integer alphabet?!')
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

# Just for fun, write a stand-alone unshift method
def decrypt string, unshift #unshift is positive
  if unshift > 25
    raise Exception.new('Unshift should logically be less than 26.')
  end
  if unshift < 1
    raise Exception.new('Unshift must be positive')
  end
  if !unshift.is_a?(Integer)
    raise Exception.new('Are you using a non-integer alphabet?!')
  end
  char_arr = string.split('') # char_arr = ['E' ,' ', 'w', 'i', 'r', 'x', 'i', 'r', 'g', 'i','.']
  char_arr.map do |char|
    char = char.ord # ASCII numberic
    if char - unshift >= 97 && char <= 122 ||  char - unshift >= 65 && char <= 90 # Char does not shift out of its alphabet
      char -= unshift
    elsif char >= 97 && char <= 122 # Lowercase
      # Shift the character the remainder over only
      under = 97 - (char - unshift)
      char = 123 - under
    elsif char >= 65 && char <= 90 # Uppercase
      # Shift the character the remainder over only
      under = 65 - (char - unshift)
      char = 91 - under
    end
    char = char.chr
  end.join("")
#rescue Exception
  #puts 'Shift should logically be less than 26.'
end
