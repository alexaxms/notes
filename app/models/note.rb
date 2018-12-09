class Note < ApplicationRecord
  include Filterable
  after_create :setbackgroundcolor
  ########################### SCOPE ############################
  scope :title, -> (title) { where("title LIKE ?", "%#{title}%")}
  scope :description, -> (description) { where("description LIKE ?", "%#{description}%")}
  scope :created_min, -> (start_date) {where('created_at >= ?', start_date.to_date)}
  scope :created_max, -> (end_date) {where('created_at <= ?', end_date.to_date)}
  scope :begin_min, -> (start_date) {where('begin >= ?', start_date.to_date)}
  scope :begin_max, -> (end_date) {where('begin <= ?', end_date.to_date)}

  def setbackgroundcolor
    case self.hoursleft
    when 0..1
      self.backgroundcolor = "lightcoral"
    when 1..24
      self.backgroundcolor = "lightgreen"
    when -999999..0
      self.backgroundcolor = "darkgray"
    else
      self.backgroundcolor = "lightskyblue"
    end
    self.save
  end

  def hoursleft
    (self.begin.to_time-Time.now).to_i/3600.0
  end

  def self.updatebgc
    @notes = Note.all
    @notes.each do |note|
      note.setbackgroundcolor
    end
  end

  def self.current
    @notes = Note.all
    @notes.each do |note|
      if note.begin.to_time<Time.now && note.end.to_time>Time.now
        return note
      end
    end
    return nil
  end
end
