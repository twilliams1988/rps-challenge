# This bot is an attempt at more human behaviour based on an academic
# paper by Zhijian Wang.
# Zhijian noticed that winning players tended to stick
# with their winning strategy, while losers tended to
# switch to the next strategy in the sequence of rock-paper-scissors,
# following what he calls "persistent cyclic flows".


class Bot
# Zhijian Wang (AI)
  def initialize
    @gesture = nil
    @gesture_history = [:rock, :paper]
    @gestures = [:rock, :paper, :scissors, :spock, :lizard]

  end

  def gesture(previous_winner = nil)
    if @gesture_history[-1] == @gesture_history[-2] # trying to prevent three in a row repeat as unhuman.
      @gesture = @gestures[rand(4)]
    elsif previous_winner == 'computer' # higher liklihood of replaying a winning gesture
      rand(1..2) == 1 ? @gesture = @gesture_history.pop : @gesture =  @gestures[rand(4)]
    elsif previous_winner == 'you' # higher liklihood of chosing the next gesture in the sequence if just lost.
      rand(1..2) == 1 ? @gesture = @gestures[@gestures.index(@gesture_history.pop) + 1] : @gesture = @gestures[rand(4)]
      @gesture = :rock if @gesture == nil
    else
      @gesture = @gestures[rand(4)]
    end
    @gesture_history << @gesture
    @gesture
  end
end
