def greetings(name, job)
  "Hello, #{name.join(" ")}! Nice to have a #{job[:title]} #{job[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber'})
