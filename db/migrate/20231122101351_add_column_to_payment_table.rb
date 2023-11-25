# frozen_string_literal: true

class AddColumnToPaymentTable < ActiveRecord::Migration[7.1]
  def change
    add_reference :payments, :category, foreign_key: true
  end
end
