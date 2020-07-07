class AddUsernamePasswordToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :username, :string
    add_column :players, :password, :string
  end
end
