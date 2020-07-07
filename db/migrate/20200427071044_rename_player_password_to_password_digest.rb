class RenamePlayerPasswordToPasswordDigest < ActiveRecord::Migration[6.0]
  def change
    rename_column :players, :password, :password_digest
  end
end
