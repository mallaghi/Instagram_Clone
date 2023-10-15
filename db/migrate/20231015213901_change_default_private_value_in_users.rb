class ChangeDefaultPrivateValueInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :private, from: true, to: false
  end
end
