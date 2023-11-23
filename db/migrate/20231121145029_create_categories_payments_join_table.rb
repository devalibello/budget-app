# frozen_string_literal: true

class CreateCategoriesPaymentsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :payments, :categories
  end
end
