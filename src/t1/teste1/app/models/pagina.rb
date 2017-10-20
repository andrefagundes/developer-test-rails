class Pagina < ActiveRecord::Base
  validates_presence_of :title, :description, :body, :author
  validates_uniqueness_of :title
end