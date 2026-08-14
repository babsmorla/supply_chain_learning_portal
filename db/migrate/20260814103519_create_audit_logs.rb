class CreateAuditLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :auditable, polymorphic: true, null: false
      t.string :action
      t.string :old_value
      t.string :new_value

      t.timestamps
    end
  end
end
