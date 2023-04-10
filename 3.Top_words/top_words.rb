def top_words(text)
    word_counts = Hash.new(0)

    text.scan(/[a-z']+/i).each do |word|
      word_counts[word.downcase] += 1
    end

    top_words = word_counts.sort_by { |word, count| -count }.first(3)

    top_words.map(&:first)
  end

  text = "In a village of La Mancha, the name of which I have no desire to call to
  mind, there lived not long since one of those gentlemen that keep a lance
  in the lance-rack, an old buckler, a lean hack, and a greyhound for
  coursing. An olla of rather more beef than mutton, a salad on most
  nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
  on Sundays, made away with three-quarters of his income."

  puts top_words(text)