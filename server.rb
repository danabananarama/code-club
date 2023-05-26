require 'socket'
require "pp"

puts "Starting server"
Socket.udp_server_loop(6969) {|msg, msg_src|
  puts "Server got #{msg.inspect}"
  # n because there's some formats that are common in networks
  message_unpacked = msg.unpack('nZ*Z*')

  pp message_unpacked
  _op_number, filename, _mode = message_unpacked

  # puts "msg_src is #{msg_src.inspect}"
  # pp msg_src.remote_address.ip_port
  # pp (msg_src.remote_address.methods - Object.new.methods)
  # pp (msg_src.methods - Object.new.methods)

  response_data = [3, 1, File.read(filename)]
  response_packet = response_data.pack('nnZ*')

  pp response_data
  pp response_packet

  msg_src.reply response_packet

  #    2. Host B sends a "DATA" (with block number= 1) to host  A  with
  #    source= B's TID, destination= A's TID.
  puts "Server replied?"
}
puts "Server dead?"
