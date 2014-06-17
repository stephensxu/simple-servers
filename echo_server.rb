require 'socket'

server = TCPServer.new(2000)

# An "echo server" read a single line of input from the client, echoes that
# input line back to the client, hangs up, and listens for a new connection.

loop do
  puts "Waiting for new clients on port #{server.addr[1]}..."
  client = server.accept
  echo_message = client.gets
  client.puts(echo_message)
  client.close

  # Use client.gets to read a line of input from the client
  # Use client.puts to send a line of input to the client
  # Use client.close to hang up on the client
end
