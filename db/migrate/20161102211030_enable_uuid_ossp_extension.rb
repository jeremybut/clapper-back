# frozen_string_literal: true
class EnableUuidOsspExtension < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'
  end
end
