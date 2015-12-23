class Game
  attr_reader :id, :stories

  COUNT = 10
  BREAK = "-"*50

  def initialize(id, stories: [])
    @id = id
    @stories = stories
    @current_story_index = 0
  end

  def current_story_string
    @stories[@current_story_index].to_s
  end

  def next_story
    @current_story_index+=1
  end

  def previous_story
    @current_story_index-=1
  end

  def open
    system "open #{@stories[@current_story_index].url}"
  end

  def none

  end

  def to_s
    start = "Stories for game id #{@id}"
    @stories.inject(start) do |acc, story|
      acc + story.to_s + BREAK
    end
  end
end
