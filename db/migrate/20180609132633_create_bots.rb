class CreateDelphosbots < ActiveRecord::Migration[5.2]
  def change
    create_table :delphosbots do |t|

      t.timestamps
    end
  end
end
