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
    t.integer :user_id
    t.integer :reader_id
  end

  create_table :accounts do |t|
    t.integer :user_id
  end

  create_table :images_users, id: false do |t|
    t.integer :image_id
    t.integer :user_id
  end

  create_table :images do |t|
    t.string :filename
  end
end
