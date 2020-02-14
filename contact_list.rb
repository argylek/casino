@contacts = [
  { name: "Sam", phone: "801-222-4444" },
  { name: "Steve", phone: "801-554-9182" },
  { name: "Alice", phone: "801-432-8743" },
  { name: "Vicky", phone: "435-668-2349" },
  { name: "Milo", phone: "801-666-1212" },
]

def seperator
  puts '*' * 10
  puts
end

#create menu
def menu
  seperator
  puts "Please select an Option"
  puts "\n1) Create a New Contact"
  puts "2) View Contacts"
  puts "3) Delete a Contact"
  puts "4) Update a Contact"
  puts "5) Exit"
end

#user input
def user_selection
  menu
  choice = gets.to_i
  case choice
    when 1
      contact_create
    when 2
      contact_view
    when 3
      contact_delete
    when 4
      contact_update
    when 5
      puts 'Goodbye!'
      exit
    else
      puts 'Invalid Choice - try again'
  end

  user_selection
end



# #1 Create Contacts
def contact_create
  contact = @contacts
    puts "Enter the name of your new Contact"
  new_name = gets.chomp
    puts "Enter the Phone number of your new Contact(in format XXX-XXX-XXXX)"
  new_phone = gets.chomp
    contact << {name: new_name, phone: new_phone}
  seperator
    puts "#{new_name} has been added with the phone number #{new_phone}"  
  seperator
    puts "returning to main menu"
end

#2 view all contacts
def contact_view
  seperator
  contacts = @contacts
  contacts.each_with_index { |contact, index|
    name = contact[:name]
    phone = contact[:phone]
    puts "#{index + 1}) Name: #{name} -- Phone: #{phone}"
  }
end




#3 Delete Contact
def contact_delete
  contacts = @contacts
  puts "Which contact would you like to delete?"
  contact_view
  puts "Please make a selection"
  user_delete = gets.to_i - 1
if  (0..contacts.size) === user_delete
  name = contacts[user_delete][:name] #name has to be loaded before the delete or it will be incorrect
  contacts.delete_at(user_delete)
  puts "You deleted #{name} from your contacts"
else
  puts "invalid selection"
end

end


#4 Update existing contact

def contact_update
  contacts = @contacts
  puts "Who would you like to update?"
  contact_view
  contact_to_update = gets.to_i-1
  if (0..contacts.size) === contact_to_update
    updater(contact_to_update)
  else
    puts "invalid input"
  end
end
#note -- add error handling

def updater(contact_to_update)
  contacts = @contacts
  name = contacts[contact_to_update][:name]
  phone = contacts[contact_to_update][:phone]
  #choice about what is being updated - or return
  seperator
    puts "You're updating #{name}, their phone number is #{phone}. What would you like to update?"
    puts "Please make a selection:"
  seperator
    puts "1) Update Name"
    puts "2) Update Number"
    puts "3) Go to main menu"
  choice = gets.to_i

  case choice
    when 1
      puts "The current name is #{name}, what would you like to change it to?"
      new_name = gets.chomp
      contacts[contact_to_update][:name]= new_name #This isn't working when using the variable #name, not sure why. Maybe a scope thing?
    when 2
      puts "The current phone number for #{name} is #{phone}, what would you like to change it to?"
      new_phone = gets.chomp
      contacts[contact_to_update][:phone] = new_phone #This isn't working when using the variable #phone, not sure why.
    when 3
      user_selection
    else
      puts "invalid choice"
  end
  seperator
  puts "The contact has been updated"
end

user_selection
