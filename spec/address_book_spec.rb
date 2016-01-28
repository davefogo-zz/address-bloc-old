require_relative '../models/address_book.rb'

RSpec.describe AddressBook do
  describe "attributes" do
    it "should respond to entries"do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('James', '415-404-4243', 'james@email.com')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('James', '415-404-4243', 'james@email.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('James')
      expect(new_entry.phone_number).to eq('415-404-4243')
      expect(new_entry.email).to eq('james@email.com')
    end
  end
  describe "#remove_entry" do
    it "removes only one entry from the address book" do
      book = AddressBook.new
      book.add_entry('James', '415-404-4243', 'james@email.com')
      book.remove_entry('James', '415-404-4243', 'james@email.com')

      expect(book.entries.size).to eq(0)
    end

    it "removes the correct information from entries" do
      book = AddressBook.new
      book.add_entry('James', '415-404-4243', 'james@email.com')
      new_entry = book.entries[0]
      book.remove_entry('James', '415-404-4243', 'james@email.com')

      expect(new_entry.name).to eq(nil)
      expect(new_entry.phone_number).to eq(nil)
      expect(new_entry.email).to eq(nil)
    end
  end
end
