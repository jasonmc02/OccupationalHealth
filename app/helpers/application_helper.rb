module ApplicationHelper

  def link_to_add_fields(name, f, association, object_id, classes)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id.to_s
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("partials/" + association.to_s.singularize + "_form", :f => builder)
    end
    link_to(name, '#',:id => object_id, :class => classes, data: {id: id, fields: fields.gsub("\n", "")})
  end

  def submit_button(model)
    if model.class.name.underscore == "user_file"
      model_name = I18n.t "activerecord.models.user_file.model_util"
      if model.new_record?
        I18n.t("helpers.submit.add", :model => model_name)
      else
        I18n.t("helpers.submit.update", :model => model_name)
      end
    elsif model.class.name.underscore == "form_wrapper"
      if model.new_record?
        model_name = I18n.t "activerecord.models.custom_form.plural"
        I18n.t("helpers.submit.add", :model => model_name)
      else
        model_name = I18n.t "activerecord.models.form_wrapper.single"
        I18n.t("helpers.submit.update", :model => model_name)
      end
    elsif model.class.name.underscore == "section"
      if model.new_record?
        model_name = I18n.t "activerecord.models.section.single"
        I18n.t("helpers.submit.add", :model => model_name)
      else
        model_name = I18n.t "activerecord.models.section.single"
        I18n.t("helpers.submit.update", :model => model_name)
      end
    elsif model.class.name.underscore == "custom_form"
      model_name = I18n.t "activerecord.models.custom_form.single"
      if model.new_record?
        I18n.t("helpers.submit.add", :model => model_name)
      else
        I18n.t("helpers.submit.update", :model => model_name)
      end
    else
      model_name = I18n.t "activerecord.models.#{model.class.name.underscore}"
      if model.new_record?
        I18n.t("helpers.submit.create", :model => model_name)
      else
        I18n.t("helpers.submit.update", :model => model_name)
      end
    end
  end

  def checked_formulary_profile_fields_one(profile)
    result = []
    model_tree = "activerecord.attributes.formulary_profile."
    result.push(t "#{model_tree}mining") if profile.mining
    result.push(t "#{model_tree}pesticide") if profile.pesticide
    result.push(t "#{model_tree}occupational_health") if profile.occupational_health
    result.push(t "#{model_tree}community_paticipation") if profile.community_paticipation
    result.push(t "#{model_tree}watershed_management") if profile.watershed_management
    result.push(t "#{model_tree}solid_waste_management") if profile.solid_waste_management
    result.push(t "#{model_tree}public_health") if profile.public_health
    result.push(t "#{model_tree}animal_health") if profile.animal_health
    result.push(t "#{model_tree}determinant_of_health") if profile.determinant_of_health
    result.push(t "#{model_tree}food_sovereignty") if profile.food_sovereignty
    result.push(t "#{model_tree}indigenous_health") if profile.indigenous_health
    result.push(t "#{model_tree}climate_change") if profile.climate_change
    result.push(t "#{model_tree}forest_management") if profile.forest_management
    result.push(t "#{model_tree}training") if profile.training
    if profile.other_areas
      result.push(t("#{model_tree}other_areas") + " (#{profile.which_areas})")
    end
    concat_result(result)
  end

  def checked_formulary_profile_fields_two(profile)
    result = []
    model_tree = "activerecord.attributes.formulary_profile."
    result.push(t "#{model_tree}project") if profile.project
    result.push(t "#{model_tree}part_program") if profile.part_program
    result.push(t "#{model_tree}entire_program") if profile.entire_program
    if profile.other_project
      result.push(t("#{model_tree}other_project") + " (#{profile.which_project})")
    end
    concat_result(result)
  end
  
  def checked_formulary_profile_fields_three(profile)
    result = []
    model_tree = "activerecord.attributes.formulary_profile."
    result.push(t "#{model_tree}research") if profile.research
    result.push(t "#{model_tree}action") if profile.action
    result.push(t "#{model_tree}policy") if profile.policy
    concat_result(result)
  end

  def checked_formulary_context_fields_one(context)
    result = []
    model_tree = "activerecord.attributes.formulary_context."
    result.push(t "#{model_tree}urban") if context.urban
    result.push(t "#{model_tree}semiurban") if context.semiurban
    result.push(t "#{model_tree}rural") if context.rural
    result.push(t "#{model_tree}wilderness") if context.wilderness
    if context.disrupted
      disruptions = t "#{model_tree}disrupted"
      disruption_types = []
      disruption_types.push(t "#{model_tree}resource_extraction") if context.resource_extraction
      disruption_types.push(t "#{model_tree}environmental_degradation") if context.environmental_degradation
      disruption_types.push(t "#{model_tree}climate_effect") if context.climate_effect
      disruption_types.push(t "#{model_tree}natural_force") if context.natural_force
      disruptions += " (#{concat_result(disruption_types)})"
      result.push(disruptions) 
    end
    result.push(t "#{model_tree}coastal") if context.coastal
    result.push(t "#{model_tree}agricultural") if context.agricultural
    if context.forest
      forests = t "#{model_tree}forest"
      forests_types = []
      forests_types.push(t "#{model_tree}rainfores") if context.rainfores
      forests_types.push(t "#{model_tree}cloud_forest") if context.cloud_forest
      forests_types.push(t "#{model_tree}dry_forest") if context.dry_forest
      forests_types.push(t "#{model_tree}old_growth_forest") if context.old_growth_forest
      forests_types.push(t "#{model_tree}mixed_forest") if context.mixed_forest
      forests_types.push(t "#{model_tree}other_scale") if context.other_scale
      if context.other_scale
        forests_types.push(t("#{model_tree}other_scale") + "#{context.which_scale}")
      end
      forests += " (#{concat_result(forests_types)})"
      result.push(disruptions) 
    end
    if context.watershed
      result.push(t("#{model_tree}watershed") + " (#{context.watersheed_name})")
    end
    result.push(t "#{model_tree}wetland") if context.wetland
    result.push(t "#{model_tree}desert") if context.desert
    concat_result(result)
  end

  def checked_formulary_context_fields_two(context)
    result = []
    model_tree = "activerecord.attributes.formulary_context."
    result.push(t "#{model_tree}gender") if context.gender
    result.push(t "#{model_tree}equity") if context.equity
    result.push(t "#{model_tree}community_participation") if context.community_participation
    result.push(t "#{model_tree}policy") if context.policy
    result.push(t "#{model_tree}complexity") if context.complexity
    result.push(t "#{model_tree}other_approach") if context.other_approach
    if context.other_approach
      result.push(t("#{model_tree}other_approach") + " (#{context.which_approach})")
    end
    concat_result(result)
  end

  def checked_formulary_research_fields_one(research)
    result = []
    model_tree = "activerecord.attributes.formulary_research."
    result.push(t "#{model_tree}test_hypothesis") if research.test_hypothesis
    result.push(t "#{model_tree}generate_knowledge") if research.generate_knowledge
    result.push(t "#{model_tree}inlcude_actor") if research.inlcude_actor
    result.push(t "#{model_tree}translate_knowledge") if research.translate_knowledge
    result.push(t "#{model_tree}influencing_legislation") if research.influencing_legislation
    result.push(t "#{model_tree}no_impact") if research.no_impact
    if research.other_integration
      result.push(t("#{model_tree}other_integration") + " (#{research.other_integration})")
    end
    concat_result(result)
  end

  def checked_formulary_action_fields_one(action)
    result = []
    model_tree = "activerecord.attributes.formulary_action."
    result.push(t "#{model_tree}community_leader") if action.community_leader
    result.push(t "#{model_tree}decision_maker") if action.decision_maker
    result.push(t "#{model_tree}other_research_group") if action.other_research_group
    result.push(t "#{model_tree}community_group") if action.community_group
    result.push(t "#{model_tree}ngos") if action.ngos
    result.push(t "#{model_tree}business") if action.business
    result.push(t "#{model_tree}church") if action.church
    result.push(t "#{model_tree}other_participation") if action.other_participation
    concat_result(result)
  end

  def checked_formulary_action_fields_two(action)
    result = []
    model_tree = "activerecord.attributes.formulary_action."
    result.push(t "#{model_tree}municipal_actors") if action.municipal_actors
    result.push(t "#{model_tree}regional_actors") if action.regional_actors
    result.push(t "#{model_tree}national_actors") if action.national_actors
    result.push(t "#{model_tree}other_actors") if action.other_actors
    result.push(t "#{model_tree}none_actors") if action.none_actors
    concat_result(result)
  end

  def checked_formulary_action_fields_three(action)
    result = []
    model_tree = "activerecord.attributes.formulary_action."
    result.push(t "#{model_tree}entire_process") if action.entire_process
    result.push(t "#{model_tree}research_part") if action.research_part
    result.push(t "#{model_tree}not_participatory_process") if action.not_participatory_process
    concat_result(result)
  end

  def checked_formulary_action_fields_four(action)
    result = []
    model_tree = "activerecord.attributes.formulary_action."
    if action.implement
      result.push(t("#{model_tree}implement") + " (#{action.implement_description})")
    end
    if action.new_methodologies
      result.push(t("#{model_tree}new_methodologies") + " (#{action.new_methodologies_description})")
    end
    if action.other_incorporation
      result.push(t("#{model_tree}other_incorporation") + " (#{action.other_incorporation_description})")
    end
    if action.influence
      result.push(t("#{model_tree}influence") + " (#{action.influence_description})")
    end
    concat_result(result)
  end

  def checked_formulary_action_fields_five(action)
    result = []
    model_tree = "activerecord.attributes.formulary_action."
    result.push(t "#{model_tree}develop_understanding") if action.develop_understanding
    result.push(t "#{model_tree}including_actor") if action.including_actor
    result.push(t "#{model_tree}enhancing_participation") if action.enhancing_participation
    result.push(t "#{model_tree}improving_communication") if action.improving_communication
    result.push(t "#{model_tree}other_changes") if action.other_changes
    result.push(t "#{model_tree}none_changes") if action.none_changes
    concat_result(result)
  end

  def checked_formulary_action_fields_six(action)
    result = []
    model_tree = "activerecord.attributes.formulary_action."
    result.push(t "#{model_tree}local_impacts") if action.local_impacts
    result.push(t "#{model_tree}regional_impacts") if action.regional_impacts
    result.push(t "#{model_tree}national_impacts") if action.national_impacts
    result.push(t "#{model_tree}international_impacts") if action.international_impacts
    result.push(t "#{model_tree}global_impacts") if action.global_impacts
    concat_result(result)
  end

  def checked_formulary_policy_fields_one(policy)
    result = []
    model_tree = "activerecord.attributes.formulary_policy."
    result.push(t "#{model_tree}improve_strategies") if policy.improve_strategies
    result.push(t "#{model_tree}prevent_strategies") if policy.prevent_strategies
    result.push(t "#{model_tree}actor_strategies") if policy.actor_strategies
    if policy.other
      result.push(t("#{model_tree}other") + " (#{policy.other_description})")
    end
    concat_result(result)
  end

  def concat_result(result)
    response = ""
    if result.length > 0
      if result.length > 1
        response = result[0..-2].join(", ") + I18n.t("helpers_locale.application_helper.and") + result[-1]
      else
        response = result[0]
      end
    end
  end

  def concat_result_single_line(result)
    response = ""
    if result.length > 0
      if result.length > 1
        response = result.join("\n")
      else
        response = result[0]
      end
    end
  end
end
