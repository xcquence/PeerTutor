class CreateStripeAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :stripe_accounts do |t|
        t.string :first_name
        t.string :last_name
        t.string :account_type
        t.integer  :dob_month
        t.integer  :dob_day
        t.integer  :dob_year
        t.datetime :created_at,            null: false
        t.datetime :updated_at,            null: false
        t.string   :address_city
        t.string   :address_state
        t.string   :address_line1
        t.string   :address_postal
        t.string   :ssn_last_4
        t.string   :business_name
        t.string   :business_tax_id
        t.string   :personal_id_number
        t.string   :verification_document
        t.string   :acct_id

        t.timestamps
    end
  end
end
