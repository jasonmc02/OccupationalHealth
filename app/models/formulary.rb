class Formulary < ActiveRecord::Base

  belongs_to :user

  has_one :formulary_profile, :dependent => :destroy
  has_one :formulary_context, :dependent => :destroy
  has_one :formulary_research, :dependent => :destroy
  has_one :formulary_action, :dependent => :destroy
  has_one :formulary_policy, :dependent => :destroy
  has_many :formulary_contacts, :dependent => :destroy

  accepts_nested_attributes_for :formulary_profile, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :formulary_context, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :formulary_research, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :formulary_action, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :formulary_policy, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }
  accepts_nested_attributes_for :formulary_contacts, :allow_destroy => true#, :reject_if => lambda { |a| a[:content].blank? }

  def self.fetch_formularies(object)
    fields = []
    params = []
    statements = []
    if object.has_key?(:formulary_profiles)
      object[:formulary_profiles].each do |key, val|
        case val[:sk]
        when "string"
          fields.push("formulary_profiles.#{val[:sc]} like ?")
          params.push("%#{val[:sp]}%")
        when "boolean"
          fields.push("formulary_profiles.#{val[:sc]} = ?")
          params.push(1)
        when "date_beging"
          fields.push("formulary_profiles.#{val[:sc]} >= ?")
          params.push("#{val[:sp]}")
        when "date_end"
          fields.push("formulary_profiles.#{val[:sc]} <= ?")
          params.push("#{val[:sp]}")
        end
      end
    end
    if object.has_key?(:formulary_contexts)
      object[:formulary_contexts].each do |key, val|
        case val[:sk]
        when "string"
          fields.push("formulary_contexts.#{val[:sc]} like ?")
          params.push("%#{val[:sp]}%")
        when "boolean"
          fields.push("formulary_contexts.#{val[:sc]} = ?")
          params.push(1)
        when "boolean_simple"
          fields.push("formulary_contexts.#{val[:sc]} = ?")
          params.push(1)
        when "select"
          fields.push("formulary_contexts.#{val[:sc]} = ?")
          params.push("#{val[:sp]}")
        end
      end
    end
    if object.has_key?(:formulary_researches)
      object[:formulary_researches].each do |key, val|
        case val[:sk]
        when "string"
          fields.push("formulary_researches.#{val[:sc]} like ?")
          params.push("%#{val[:sp]}%")
        when "boolean"
          fields.push("formulary_researches.#{val[:sc]} = ?")
          params.push(1)
        when "boolean_simple"
          fields.push("formulary_researches.#{val[:sc]} = ?")
          params.push(1)
        end
      end
    end
    if object.has_key?(:formulary_actions)
      object[:formulary_actions].each do |key, val|
        case val[:sk]
        when "string"
          fields.push("formulary_actions.#{val[:sc]} like ?")
          params.push("%#{val[:sp]}%")
        when "boolean"
          fields.push("formulary_actions.#{val[:sc]} = ?")
          params.push(1)
        when "boolean_simple"
          fields.push("formulary_actions.#{val[:sc]} = ?")
          params.push(1)
        end
      end
    end
    if object.has_key?(:formulary_policies)
      object[:formulary_policies].each do |key, val|
        case val[:sk]
        when "string"
          fields.push("formulary_policies.#{val[:sc]} like ?")
          params.push("%#{val[:sp]}%")
        when "boolean"
          fields.push("formulary_policies.#{val[:sc]} = ?")
          params.push(1)
        when "boolean_simple"
          fields.push("formulary_policies.#{val[:sc]} = ?")
          params.push(1)
        when "select"
          fields.push("formulary_policies.#{val[:sc]} = ?")
          params.push("#{val[:sp]}")
        end
      end
    end
    fields = fields.join(" and ")
    statements.push(fields)
    statements = statements + params
    statements = sanitize_sql_for_conditions(statements)
    statements = Sanitize.fragment(statements)
    select('formularies.*, formulary_profiles.name, users.email')
    .joins(:formulary_profile, :formulary_context, :formulary_research, :formulary_action, :formulary_policy, :user)
    .where(statements)
    .load
  end
end
