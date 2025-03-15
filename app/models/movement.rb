class Movement < ApplicationRecord
  enum :kind, {
    debit: 1,
    bank_slip: 2,
    financing: 3,
    credit: 4,
    loan_receipt: 5,
    sales: 6,
    ted_receipt: 7,
    doc_receipt: 8,
    rent: 9
  }, validate: true

  validates_presence_of :occurred_on, :value, :personal_code, :card_number, :occurred_at

  belongs_to :store, class_name: 'Store'

  after_create :update_store_balance

  def update_store_balance
    store.update(balance: store.balance + value)
  end
end
