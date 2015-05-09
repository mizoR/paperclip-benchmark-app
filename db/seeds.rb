data = Hash.new { |hash, key|
  login    = "users/#{key}"
  password = "passwords/#{key}"
  avatar   = File.open(Rails.root.join('data', 'Lenna.png'))

  { login: login, password: password, avatar: avatar }
}

User.destroy_all

(1..10).each do |i|
  puts User.create!(data[i])
end
