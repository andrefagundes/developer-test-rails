class CreatePaginas < ActiveRecord::Migration[5.1]
  def change
    create_table :paginas do |t|
      t.string :title
      t.string :description
      t.string :body
      t.string :author
      t.timestamps
    end
  end
end