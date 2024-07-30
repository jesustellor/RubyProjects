puts "Enter message to encrypt: "
string = gets.chomp
puts "Enter shift from alphabet value: "
shift = gets.chomp.to_i
def ceasar_cipher(string, shift)
  string = string.downcase
  string.chars.map do |char|
    if char =~ /[a-z]/
      (char.ord + shift - 97) % 26 + 97
    else
      char.ord
    end
  end.pack("C*")
end


p ceasar_cipher(string, shift)

