class TranslateItems < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Item.create_translation_table!({
                                             title: :string,
                                             article: :string,
                                             description: :text,
                                             optionsList: { type: :json, null: false, default: '{}' }
                                         }, {
                                             migrate_data: true
                                         })
      end

      dir.down do
        Item.drop_translation_table! migrate_data: true
      end
    end
  end
end
