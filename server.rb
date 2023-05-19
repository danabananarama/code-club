require 'socket'
require "pp"

puts "Starting server"
Socket.udp_server_loop(6969) {|msg, msg_src|
  puts "Server got #{msg.inspect}"
  message_unpacked = msg.unpack('nZ*Z*') # n because there's some formats that are commonr in networks

  puts "msg_src is #{msg_src.inspect}"
  pp msg_src.remote_address.ip_port
  pp (msg_src.remote_address.methods - Object.new.methods)
  pp (msg_src.methods - Object.new.methods)

  msg_src.reply msg

  #    2. Host B sends a "DATA" (with block number= 1) to host  A  with
  #    source= B's TID, destination= A's TID.
  puts "Server replied?"
}
puts "Server dead?"
