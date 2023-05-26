require 'socket'
require "pp"

puts "Starting server"
Socket.udp_server_loop(6969) {|msg, msg_src|
  puts "Server got #{msg.inspect}"
  # n because there's some formats that are common in networks
  message_unpacked = msg.unpack('nZ*Z*')

  pp message_unpacked
  op_number, filename, _mode = message_unpacked

  case op_number
  when 1
    response_data = [3, 1, File.read(filename)]
    response_packet = response_data.pack('nnZ*')

    msg_src.reply response_packet
    puts "Server replied to read request"
  when 4
    puts "ACK received"
  else
    puts "I shat the bed with op_number #{op_number}"
  end
}
puts "Server dead?"
