class RemoveAncestryFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :ancestry, :string
  end
end
