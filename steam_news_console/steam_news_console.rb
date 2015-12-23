class SteamNewsConsole
  def initialize(id)
    game = load_stories(id)
    loop do
      system 'clear'
      puts game.current_story_string
      game.send(decode_instruction(gets.chomp))
    end

  end

  def load_stories(id)
    stories = Query.new(id).news_items.map do |item|
      Story.new(item)
    end
    Game.new(id, stories: stories)
  end

  def decode_instruction(instruction)
    instruction.downcase!
    if instruction.match(/n(ext)?/)
      :next_story
    elsif instruction.match(/p(revious)?/)
      :previous_story
    elsif instruction.match(/o(pen)?/)
      :open
    elsif instruction.match(/q(uit)?/)
      exit
    else
      :none
    end
  end

end
