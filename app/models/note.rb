class Note < ApplicationRecord
  after_create :setbackgroundcolor
  def setbackgroundcolor
    case self.hoursleft
    when 0..1
      puts "Queda menos de una hora"
      self.backgroundcolor = "lightcoral"
    when 1..24
      puts "Queda menos de un día"
      self.backgroundcolor = "lightgreen"
    else
      puts "it was something else"
      self.backgroundcolor = "lightskyblue"
    end
    self.save
  end

  def hoursleft
    (self.begin.to_time-Time.now).to_i/3600.0
  end
end
