class AddPicsToCreators < ActiveRecord::Migration[6.0]
  def change
    add_column :creators, :profile_pic, :text
  end
end
