class Product < ActiveRecord::Base
  default_scope :order => 'title' # Orders products by title by default
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item 
  
  # Validations
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :title, :uniqueness => true
  validates_length_of :title, :minimum => 10 
  validates :image_url, :format => { :with => %r{\.(gif|jpg|png)$}i,
                                     :message => 'must be a URL for GIF, JPG, or PNG image.'
  }
  
  private
  
  # Ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
  
end
