require 'socket'

# This is a simple time server.  It allows a single client to connect at a time.
# When a client connects, it sends the server's current time to the client
# terminates that client's connection, and then starts waiting for a new
# connection.

# This creates a new TCP server listening on port 2000.
server = TCPServer.new(2000)

# loop do ... end will loop forever until something inside the loop
# tells the loop to stop.
loop do
  # server.addr returns an Array whose second element is the port number on
  # which this server is listening.

  puts "Waiting for new clients on port #{server.addr[1]}..."

  # This waits until a client connects
  client = server.accept
  # client.addr[2] is the IP address of the connecting client
  client_ip_addr = client.addr[2]

  # Here, "puts" will print out to the terminal in which the server is running.
  puts "[CONNECT] A client with IP address #{client_ip_addr} connected"
  puts ""

  # client.puts will send data to the client
  client.puts "---"
  client.puts "Time: #{Time.now}"
  client.puts "---"

  # Hang up on the client.
  client.close
end
