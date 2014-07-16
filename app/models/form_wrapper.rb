class FormWrapper < ActiveRecord::Base
  
  has_many :sections, :dependent => :destroy

  accepts_nested_attributes_for :sections, :allow_destroy => true

  before_save :check_active

  def check_active
    if self.active.to_s.eql?("true")
      FormWrapper.update_all(:active => false)
    end
  end
end
