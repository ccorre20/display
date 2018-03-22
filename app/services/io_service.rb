require 'serialport'

class IOService
  
  public
  def self.newCon(port)
    port_str = port
    baud_rate = 4800
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
  
    sp = nil
    if port_connected?(port_str)
      sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
    end
  
    return sp
  end
  
  private
  def self.port_connected?(port)
    return true if Dir.glob(port).count == 1
  end
end


