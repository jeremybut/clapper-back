# frozen_string_literal: true
class CreateArts < ActiveRecord::Migration[5.0]
  def up
    create_table :arts do |t|
      t.references :imageable, polymorphic: true
      t.string :kind
      t.attachment :picture

      t.timestamps
    end
  end

  def down
    remove_table :arts
  end
end
