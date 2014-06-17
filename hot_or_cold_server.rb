require 'socket'

server = TCPServer.new(2000)

def get_user_guess
  puts "Guess a number and press enter: "
  client.gets.chomp.to_i
end
# See the "hot_or_cold" kata from Week 1.
# This is a server version of that kata.

loop do
  # This returns a random number between 0 and 9999.
  number_to_guess = rand(100)
  # Wait for a client to connect
  puts("Waiting for new client to connect on port #{server.addr[1]}")
  client = server.accept
  client.puts("Guess a number and press enter: ")
  while true
    guess = client.gets.chomp.to_i   # "guess" is now an integer
    if guess < number_to_guess    # The guess is too cold
     client.puts("You are cold")
    elsif guess > number_to_guess # The guess is too hot
      client.puts("you are hot")
    else                       # The guess is juuuust right
      client.puts("juuuust right")
      break
    end
  end
  client.close
  # Once a client has connected, they will stay connected until they disconnect
  # themselves or guess the correct number
  
  # Using client.gets, read in the users guesses one guess at a time.
  # If the guess is too high,
  #    send "too hot" back to the client and wait for next guess
  # If the guess is too low,
  #    send "too cold" back to the client and wait for next guess
  # If the guess is correct,
  #   send "juuuuust right" back to the client and close the connection
end

# Note #1
# Make sure to convert the users guesses into an integer using .to_i
# See the hot_or_cold kata from Week 1 for an example.
