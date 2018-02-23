account_balance = 0.0
File.open("account_balance.txt").each do | line |
    account_balance = line.to_f
end
PASSWORD = "banana"

password_status = false
transaction_history = []
while password_status == false do
    
    puts "Welcome to the banking app. Please enter your password."
    password = gets.chomp
    if password == PASSWORD then
        password_status = true
    else
        puts "Incorrect password."
        system "clear"
    end
end
while true do
    puts "- " * 10
    puts "Transaction History:\n"
    puts transaction_history
    puts "- " * 10
    puts "Your current balance is $#{account_balance}. What would you like to do? (options: withdrawl, deposit, close)"
    input = gets.chomp
    puts "You entered #{input}"
    if input == "withdrawl" then  
        puts "How much would you like to withdraw?"
        withdrawl_amount = gets.to_f
        if withdrawl_amount <= account_balance then
            account_balance -= withdrawl_amount
            File.open('account_balance.txt', 'w') do |f|
                f.puts "#{account_balance}"
            end
            transaction_history.push "Withdrew $#{withdrawl_amount}. Balance $#{account_balance}"
            system "clear"
            puts "You withdrew $#{withdrawl_amount}"
        else
            system "clear"
            puts "Can only withdraw money you have!"
        end
    elsif input == "deposit" then
        puts "How much would you like to deposit?"
        deposit_amount = gets.to_f
        account_balance += deposit_amount
        File.open('account_balance.txt', 'w') do |f|
            f.puts "#{account_balance}"
        end
        transaction_history.push "Deposited $#{deposit_amount}. Balance $#{account_balance}"
        system "clear"
        puts "You deposited $#{account_balance}"
    elsif input == "close" then
        exit(0)

        #ends program
    else
        puts "Invalid input!"
    end
    
end
