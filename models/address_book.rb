# #8
require_relative "entry.rb"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone, email)
    # #9
    index = 0
    @entries.each do |entry|
      # #10
      if name < entry.name
        break
      end
      index += 1
    end
    # #11
    @entries.insert(index, Entry.new(name, phone, email))
  end

  def remove_entry(name, phone, email)
    # Implementation goes here
    index = 0
    @entries.each do |entry|
      if name == entry.name &&
         phone == entry.phone_number &&
         email == entry.email
        @entries.delete_at(index)
      end
    end
  end
end