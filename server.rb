require 'socket'
require "pp"

puts "Starting server"

Socket.udp_server_loop(6969) do |msg, msg_src|
  puts "[INFO] Server got #{msg.inspect}"
  # n because there's some formats that are common in networks
  op_number, rest = msg.unpack('na*')

  pp op_number

  case op_number
  when 1
    filename, _mode = rest.unpack('Z*Z*')
    pp filename, _mode

    response_data = [3, 1, File.read(filename)]
    response_packet = response_data.pack('nnZ*')

    msg_src.reply response_packet
    puts "[INFO] Server replied to read request"
  when 4
    puts "[INFO] ACK received"
  else
    puts "[ERROR] I shat the bed with op_number #{op_number}"
  end
end

puts "[EMERGENCY] Server dead?"
