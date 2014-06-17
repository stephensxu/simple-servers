require 'socket'

server = TCPServer.new(2000)

# MOTD stands for "message of the day."  The MOTD server waits for a client
# to connect and then sends the contents of motd.txt to them.

loop do
  # 1. Wait for a client to connect.
  puts "Waiting for new clients on port #{server.addr[1]}..."
  # 2. Read the contents of motd.txt using File.read
  client = server.accept
  message = File.read("motd.txt")
  # 3. Send the contents of motd.txt to the client
  client.puts(message)
  # 4. Close the client's connection
  client.close
end
