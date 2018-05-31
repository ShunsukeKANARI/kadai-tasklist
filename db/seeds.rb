(1..100).each do |number|
  Task.create(status: 'test s ' + number.to_s, content: 'test content ' + number.to_s, user_id: '1 ')
end