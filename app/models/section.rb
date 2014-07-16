class Section < ActiveRecord::Base

  belongs_to :form_wrapper
  has_many :custom_forms, :dependent => :destroy

  accepts_nested_attributes_for :custom_forms, :allow_destroy => true

  def check_index
    if self.sort_index.blank?
      other_sections = Section.where(:section_id => self.section_id).order(:sort_index).last()
      if other_sections.sort_index.blank?
        self.update_attribute(:sort_index, "1")
      else
        self.update_attribute(:sort_index, other_sections.sort_index.next)
      end
    end
  end
end
