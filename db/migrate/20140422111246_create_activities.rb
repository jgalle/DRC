class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :controller
      t.string :action
      t.string :object_id
      t.string :activity

      t.timestamps
    end
  end
end
