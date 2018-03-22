class MainController < ApplicationController
  
  def hello
    @m = Measurement.all
  end
  
  def refresh
    port = "/dev/..."
    sp = IOService.newCon(port)
    #se espera que el input se vea asi:
    #linea1: t:<float>
    #linea2: h:<int>
    t = 0.0
    h = 0
    while (o = sp.get.chomp) do
      o = o.split(':')
      if o[0] == 't'
        t = o[1].to_f
      elsif o[0] == 'h'
        h = o[1].to_i
      end
      if t != 0.0 and h != 0
        break
      end
    end 
    m = Measurement.new
    m.date = DateTime.now.to_time
    m.temp = t
    m.hum = h
    if m.save
      redirect_to :back
    end
  end
end
