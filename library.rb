# frozen_string_literal: true

@user_books = []
@library_books = {

  the_hobbit: true,
  algorithms_to_live_by: true,
  moby_dick: true,
  flatland: true
}

def seperator
  puts '*' * 10
  puts
end

# a menu for the user
def menu
  seperator
  puts 'Please Make a Selection'
  puts '1) View Available Books'
  puts '2) Checkout A Book'
  puts '3) Return A Book'
  puts '4) View Your Books'
  puts '5) Exit'
end

def user_selection
  menu
  choice = gets.to_i
  case choice
  when 1
    view_books
  when 2
    checkout_book
  when 3
    return_book
  when 4
    view_my_books
  when 5
    puts 'Goodbye!'
    exit
  else
    puts 'Invalid Choice - get out'
  end

  user_selection
end

def print_book_list(list)
  seperator
  list.each_with_index { |book, index|
    puts "#{index + 1}) #{book.to_s.gsub('_', ' ').split.map(&:capitalize).join(' ')}" }
end

def view_books
  books = @library_books.select { |_, value| value }.keys
  print_book_list(books)
  books
end

def view_my_books
  print_book_list(@user_books)
end

def checkout_book
  puts 'Select a book'
  books = view_books
  choice = gets.to_i
  if choice > 0 && choice <= books.length
    book = books[choice - 1] # We added 1 to show user readable format but our array is 0
  else
    puts 'Invalid Choice'
    checkout_book
end

  @library_books[book] = false # book is a variable containing a symbol
  # add book to user array
  @user_books << book
end

# User needs to be able to return books
def return_book
  puts 'Select a book to return'
  view_my_books
  choice = gets.to_i
  if choice > 0 && choice <= @user_books.length
    book = @user_books.delete_at(choice - 1)
    @library_books[book] = true
  else
    puts 'Invalid Choice'
    return_book
end
end

user_selection
