class CreateDashboardTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :dashboard_tasks do |t|
      t.string :name
      t.text :description
      t.boolean :status
      t.string :tags

      t.timestamps
    end
  end
end
