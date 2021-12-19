class AddUserIdToOrganization < ActiveRecord::Migration[6.1]
  def change
    add_reference :organizations, :users, foreign_key: true
  end
end
