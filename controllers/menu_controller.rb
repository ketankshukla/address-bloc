require_relative "../models/address_book"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - View entry number n"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i
    puts "You picked #{selection}"

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        if @address_book.entries.count > 0
          view_specific_entry
        else
          puts "No records"
          puts "Press any key to go back to menu"
          gets.chomp
          main_menu
        end

      when 3
        system "clear"
        create_entry
        main_menu
      when 4
        system "clear"
        search_entries
        main_menu
      when 5
        system "clear"
        read_csv
        main_menu
      when 6
        puts "Good-bye!"

        exit(0)

      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end


  def view_all_entries
    @address_book.entries.each do |entry|
    system "clear"
    puts entry.to_s
    entry_submenu(entry)
  end
  system "clear"
  puts "End of entries"
end

  def view_specific_entry
    puts "Enter the specific record you want to see"
    num = gets.to_i
    if num <= 0 || num > @address_book.entries.count
      puts "No record available"
    elsif num > 0 || num <= @address_book.entries.count
        @address_book.entries.each_with_index do |val, index|
          if index == num - 1
            puts "#{val}"
          end
        end
    end
    puts "Press any key to return to main menu"
    gets.to_i
    system "clear"
    main_menu
  end

  def create_entry

    system "clear"
    puts "New AddressBloc Entry"

    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp


    @address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)

    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"


    selection = gets.chomp

    case selection
      when "n"

      when "d"
      when "e"

      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entries_submenu(entry)
    end
  end
end