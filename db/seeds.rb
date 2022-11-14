10.times do |blog|
  Blog.create!(
    title: "My blog post #{blog}",
    body: "My body"
  )
end

puts "10 blog created successfully"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts "5 skills created successfully"
