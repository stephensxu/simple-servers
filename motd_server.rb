require 'socket'

server = TCPServer.new(2000)

# MOTD stands for "message of the day."  The MOTD server waits for a client
# to connect and then sends the contents of motd.txt to them.

loop do
  # 1. Wait for a client to connect.
  # 2. Read the contents of motd.txt using File.read
  # 3. Send the contents of motd.txt to the client
  # 4. Close the client's connection
end
