<<THOUGHTS
Currently, there is just one user input - "stop_the_game". If we consider more general case with more commands 
when user can press multiple keys like UP, LEFT it suggests that the input interface should be different. Maybe
something like: 

input.commands - returns array of symbols [:cursor_up, :cursor_left] 
input.include? :speed_up

THOUGHTS

class ConsoleInput
  def stop_the_game?
    result = ''
    $stdin.read_nonblock(1, result)
    return true unless result.empty?
  rescue
    false
  end
end