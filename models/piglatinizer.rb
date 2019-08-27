class PigLatinizer
  
  def piglatinize(string)
    words = string.split(" ")
    pig_latin = ""
    vowels = "aeiouAEIOU"
    two_letter_consonant_clusters = ["sm", "Sm","st", "gl", "Gl", "pl", "Pl", "tr", "Tr", "fl", "Fl", "th", "Th", "pr", "Pr", "sh", "Sh", "sk", "wh"]
    three_letter_consonant_clusters = ["str", "Str", "Spr", "spr"]
    
    words.each do |word|
      arr = word.split("")
      first_3_letters = arr[0..2]
      first_2_letters = arr[0..1]
      
      if vowels.include?(arr[0])
        pig_latin += " "
        pig_latin += piglatinize_word_starting_with_vowel(word)
      elsif three_letter_consonant_clusters.join.include?(first_3_letters.join)
        pig_latin += " "
        pig_latin += piglatinize_word_starting_with_3_letter_cluster(word)
      elsif two_letter_consonant_clusters.join.include?(first_2_letters.join)
        pig_latin += " "
        pig_latin += piglatinize_word_starting_with_2_letter_cluster(word)
      else
        pig_latin += " "
        pig_latin += piglatinize_regular_word(word)
      end
    end
    #don't return first element - it is a space
      pig_latin[1..-1]
  end
  
  
  def piglatinize_word_starting_with_vowel(word)
    arr = word.split("")
    arr.push("way")
    arr.join("")
  end
  
  
  def piglatinize_word_starting_with_2_letter_cluster(word)
    arr = word.split("")
    first_2_letters = arr[0..1]
    arr = arr[2..-1]
    first_2_letters.each {|letter| arr.push(letter)}
    arr.push("ay")
    arr.join
  end
  
  
  def piglatinize_word_starting_with_3_letter_cluster(word)
    arr = word.split("")
    first_3_letters = arr[0..2]
    arr = arr[3..-1]
    first_3_letters.each {|letter| arr.push(letter)}
    arr.push("ay")
    arr.join
  end
  
  
  def piglatinize_regular_word(word)
    arr = word.split("")
    first_letter = arr.shift
    arr.push(first_letter)
    arr.push("ay")
    arr.join("")
  end
  
  
  
end