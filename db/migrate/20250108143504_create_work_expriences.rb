class CreateWorkExpriences < ActiveRecord::Migration[7.0]
  def change
    create_table :work_expriences do |t|
       t.string :company
      t.date :start_date
      t.date :end_date
      t.string :job_title
      t.string :employment_type
      t.string :location
      t.string :location_type
      t.boolean :currently_working_here
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
