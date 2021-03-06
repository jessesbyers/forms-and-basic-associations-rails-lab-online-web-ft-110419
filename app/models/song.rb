class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes, reject_if: proc { |attributes| attributes['content'].blank? }

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  # def notes_attributes=(attributes)
  #   attributes.each do |attr|
  #     note = Note.find(attr)
  #     self.notes << note
  #   end
  # end
end
