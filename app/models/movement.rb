class Movement < ApplicationRecord
  enum :kind, {
    debit: "DEBIT",
    bank_slip: "BANK_SLIP",
    financing: "FINANCING",
    credit: "CREDIT",
    loan_receipt: "LOAN_RECEIPT",
    sales: "SALES",
    ted_receipt: "TED_RECEIPT",
    doc_receipt: "DOC_RECEIPT",
    rent: "RENT"
  }, validate: true

  validates_presence_of :occurred_on, :value, :personal_code, :card_number, :occurred_at

  belongs_to :store, class_name: "Store"
end
