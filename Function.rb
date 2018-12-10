def reverseandvowelless(string)
    string = string.gsub(/[aeiouAEIOUáéíóúÁÉÍÓÚ]/, '')
    puts string.reverse!
end

@string = "string"
@string = gets.chomp  
reverseandvocaless(@string)