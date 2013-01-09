Factory.define :user do |user|
  user.name "SriVarenya"
  user.email "varenya@gmail.com"
end


Factory.sequence(:email) {|n| 
  "varenya#{n}@gmail.com"
}

