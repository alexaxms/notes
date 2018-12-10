class Note < ApplicationRecord
  include Filterable
  after_create :setbackgroundcolor
  ########################### Validations ############################
  validates :title, presence: true
  validates :description, presence: true
  validate :end_after_begin?
  ########################### SCOPE ############################
  scope :title, -> (title) { where("title LIKE ?", "%#{title}%")}
  scope :description, -> (description) { where("description LIKE ?", "%#{description}%")}
  scope :created_min, -> (start_date) {where('created_at >= ?', start_date.to_date)}
  # +1 Day do the trick for this, to_date method take 00:00 as default time
  scope :created_max, -> (end_date) {where('created_at <= ?', end_date.to_date + 1.day)}
  scope :begin_min, -> (start_date) {where('begin >= ?', start_date.to_date)}
  # +1 Day do the trick for this, to_date method take 00:00 as default time
  scope :begin_max, -> (end_date) {where('begin <= ?', end_date.to_date + 1.day)}

  def setbackgroundcolor
    if self.current
      self.backgroundcolor = "#ffff7f"
    else  
      case self.hoursleft
      when 0..1
        self.backgroundcolor = "lightcoral"
      when 1..24
        self.backgroundcolor = "lightgreen"
      when -999999..-0
        self.backgroundcolor = "darkgray"
      else
        self.backgroundcolor = "lightskyblue"
      end
    end 
    self.save 
  end

  def hoursleft
    (self.begin.to_time-Time.now).to_i/3600.0
  end

  def self.updatebgc #Update all notes background color
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

  def current
    if(self.begin.to_time<Time.now && self.end.to_time>Time.now)
      return true
    else
      return false
    end
  end

  def finished
    if(self.hoursleft<0)
      return true
    else
      return false
    end
  end

  def end_after_begin?
    if self.end < self.begin
      errors.add :end, :date_error
    end
  end
end
