ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, :force => true do |t|
    t.string :firstname
    t.string :lastname
    t.string :username
    t.string :email
  end

  create_table :books, :force => true do |t|
    t.string :title
    t.string :user_id
  end
end
