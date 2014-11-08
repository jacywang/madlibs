def say(msg)
 puts "=> #{msg}"
end

def exit_with(msg)
  say msg
  exit
end

def get_words(file)
  File.open(file, "r") do |f|
    f.read
  end.split  
end

exit_with("No input file.") if ARGV.empty?
exit_with("The file doesn't exist!") if !File.exist?(ARGV[0])

contents = File.open(ARGV[0], "r") do |f|
              f.read
            end

dictionary = {
  nouns: get_words("nouns_list.txt"),
  verbs: get_words("verbs_list.txt"),
  adjectives: get_words("adjective_list.txt")
}

contents.gsub!("NOUN").each do 
  dictionary[:nouns].sample
end

contents.gsub!("VERB").each do 
  dictionary[:verbs].sample
end

contents.gsub!("ADJECTIVE").each do 
  dictionary[:adjectives].sample
end

p contents





