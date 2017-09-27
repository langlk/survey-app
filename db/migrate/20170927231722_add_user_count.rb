class AddUserCount < ActiveRecord::Migration[5.1]
  def change
    add_column(:answers, :user_count, :integer)
  end
end
