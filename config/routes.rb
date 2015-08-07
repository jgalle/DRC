DrcInterface::Application.routes.draw do

  resources :artifact_boxes do
    collection do
      get 'duplicate'
      get 'contexts'
      get 'context_info'
    end
  end

  resources :image_subtypes

  resources :image_materials

  resources :image_forms

  resources :image_file_formats

  resources :website_regions

  resources :activities

  resources :button_shapes

  resources :articles

  resources :tobacco_pipe_motif_manu_teches

  resources :project_website_regions

  resources :context_sample_statuses

  resources :context_sample_institutions

  resources :context_sample_locations

  resources :ceramic_sty_elem_wares

  resources :ceramic_sty_elem_meta_data

  resources :ceramic_sty_elem_manu_teches

  resources :ceramic_sty_elem_individual_design_elements

  resources :ceramic_sty_elem_individual_designs

  resources :ceramic_sty_elem_genres

  resources :ceramic_sty_elem_dec_teches

  resources :basic_colors

  resources :utensil_specifics


  resources :utensil_shapes


  resources :utensil_platings


  resources :utensil_parts


  resources :utensil_materials


  resources :utensil_manu_teches


  resources :utensil_handle_decorations


  resources :utensil_forms


  resources :utensil_fork_tine_counts


  resources :utensils do
    collection do
      get 'artifact_ids'
      get 'duplicate'
      get 'images'
      get 'gen_objects'
      get 'image_info'
      get 'object_info'
    end
  end


  resources :tobacco_pipe_materials


  resources :tobacco_pipe_text_mark_types


  resources :tobacco_pipe_text_marks


  resources :tobacco_pipe_text_frame_motifs


  resources :tobacco_pipe_mouthpiece_forms


  resources :tobacco_pipe_motif_text_locations


  resources :tobacco_pipe_manu_teches


  resources :tobacco_pipe_glaze_types


  resources :tobacco_pipe_decorations


  resources :tobacco_pipe_dec_motifs


  resources :tobacco_pipe_bowl_dec_motifs


  resources :tobacco_pipe_bowl_completenesses


  resources :tobacco_pipe_bowl_base_forms


  resources :tobacco_pipe_bowl_base_types


  resources :tobacco_pipes do
    collection do
      get 'artifact_ids'
      get 'duplicate'
      get 'images'
      get 'gen_objects'
      get 'image_info'
      get 'object_info'
    end
  end


  resources :gen_object_vessel_categories


  resources :gen_object_types


  resources :gen_object_shapes


  resources :gen_object_materials


  resources :gen_object_manufacture_countries


  resources :gen_object_manu_teches


  resources :gen_object_locations


  resources :gen_object_forms


  resources :gen_object_dec_teches


  resources :gen_object_dec_patterns


  resources :gen_object_completenesses


  resources :gen_object_colors


  resources :gen_object_artifacts


  resources :gen_objects do
    collection do
      get 'artifact_ids'
      get 'duplicate'
      get 'images'
      get 'gen_objects'
      get 'image_info'
      get 'object_info'
    end
  end


  resources :glass_vessel_categories


  resources :glass_stemware_foot_shapes


  resources :glass_stemware_body_shapes


  resources :glass_stem_shapes


  resources :glass_pontil_marks


  resources :glass_mold_types


  resources :glass_mends


  resources :glass_materials


  resources :glass_mark_locations


  resources :glass_marks


  resources :glass_manu_teches


  resources :glass_forms


  resources :glass_dec_tech_types


  resources :glass_dec_tech_sty_elems


  resources :glass_dec_teches


  resources :glass_completenesses


  resources :glass_colors


  resources :glass_bottle_treatments


  resources :glass_bottle_shapes


  resources :glass_bottle_manu_teches


  resources :glass_bottle_elements


  resources :glass_bottles


  resources :glasses do
    collection do
      get 'artifact_ids'
      get 'duplicate'
      get 'images'
      get 'gen_objects'
      get 'image_info'
      get 'object_info'
    end
  end

  resources :button_decorations


  resources :buckle_dec_tech_types


  resources :bone_mark_locations


  resources :gen_artifact_nail_modifications


  resources :gen_artifact_nail_heads


  resources :gen_artifact_nail_ends


  resources :gen_artifact_material_types


  resources :gen_artifact_materials


  resources :gen_artifact_manu_teches


  resources :gen_artifact_forms


  resources :gen_artifact_dec_tech_types


  resources :gen_artifact_dec_teches


  resources :gen_artifact_completenesses


  resources :gen_artifact_categories


  resources :gen_artifact_brick_sizes


  resources :gen_artifacts do
    collection do
      get 'artifact_ids'
      get 'duplicate'
      get 'images'
      get 'gen_objects'
      get 'image_info'
      get 'object_info'
    end
  end

  resources :button_types


  resources :button_shank_styles


  resources :button_shank_materials


  resources :button_shank_conditions


  resources :button_metal_colors


  resources :button_materials


  resources :button_manu_teches


  resources :button_join_methods


  resources :button_jewel_inlay_materials


  resources :button_eyes


  resources :button_dec_teches


  resources :buttons do
    collection do
      get 'artifact_ids'
      get 'duplicate'
      get 'images'
      get 'gen_objects'
      get 'image_info'
      get 'object_info'
    end
  end


  resources :buckle_types


  resources :buckle_shapes


  resources :buckle_parts


  resources :buckle_materials


  resources :buckle_manu_teches


  resources :buckle_frame_platings


  resources :buckle_forms


  resources :buckle_elements


  resources :buckle_dec_teches


  resources :buckle_dec_motifs


  resources :buckle_completenesses


  resources :buckles do
    collection do
      get 'artifact_ids'
      get 'duplicate'
      get 'images'
      get 'gen_objects'
      get 'image_info'
      get 'object_info'
    end
  end


  resources :bone_yes_no_probablies


  resources :bone_tooth_wears


  resources :bone_tooth_types


  resources :bone_taxon_categories


  resources :bone_taxons


  resources :bone_symmetries


  resources :bone_summaries


  resources :bone_sizes


  resources :bone_sexes


  resources :bone_reliabilities


  resources :bone_measuring_descriptions


  resources :bone_measures


  resources :bone_mark_types


  resources :bone_mark_directions


  resources :bone_locations


  resources :bone_fusions


  resources :bone_elements


  resources :bone_descriptors


  resources :bone_conditions


  resources :bone_chew_types


  resources :bone_chew_locations


  resources :bone_butcher_chew_locations


  resources :bone_butcher_methods


  resources :bone_butcher_locations


  resources :bone_butcher_directions


  resources :bones do
    collection do
      get 'artifact_ids'
      get 'duplicate'
      get 'images'
      get 'gen_objects'
      get 'image_info'
      get 'object_info'
    end
  end


  resources :completenesses


  resources :bead_structures


  resources :bead_shapes


  resources :bead_materials


  resources :bead_manu_teches


  resources :bead_kidd_bead_types


  resources :bead_forms


  resources :bead_end_treatments


  resources :bead_diaphaneities


  resources :bead_decorations


  resources :bead_dec_teches


  resources :bead_complex_shapes


  resources :bead_casing_layers


  resources :bead_casings


  resources :beads do
    collection do
      get 'artifact_ids'
      get 'duplicate'
      get 'images'
      get 'gen_objects'
      get 'image_info'
      get 'object_info'
    end
  end


  devise_for :users

  resources :ceramic_mends


  resources :ceramic_colono_thicknesses


  resources :ceramic_use_wear_patterns


  resources :ceramic_use_wear_locations


  resources :ceramic_use_wears


  resources :paste_inclusions


  resources :ceramic_paste_inclusions


  resources :ceramic_dec_tech_motifs


  resources :ceramic_dec_tech_sty_elements


  resources :ceramic_dec_tech_locations


  resources :ceramic_dec_tech_interior_exteriors


  resources :ceramic_dec_tech_types


  resources :ceramic_dec_teches


  resources :generate_context_artifacts


  resources :ceramic_glaze_opacities


  resources :ceramic_cewdec_modes


  resources :ceramic_cewtypes


  resources :ceramic_cewfootring_forms


  resources :ceramic_cewbase_forms


  resources :ceramic_pattern_names


  resources :ceramic_paste_inclusion_densities


  resources :ceramic_rim_angles


  resources :ceramic_rim_forms


  resources :acdistances


  resources :ceramic_base_marks


  resources :ceramic_genres


  resources :ceramic_burnings


  resources :ceramic_oxidizeds


  resources :ceramic_glazes


  resources :ceramic_completenesses


  resources :ceramic_forms


  resources :ceramic_vessel_categories


  resources :ceramic_wares


  resources :ceramic_manu_teches


  resources :ceramic_materials


  resources :ceramics do
    collection do
      get 'artifact_ids'
      get 'duplicate'
      get 'images'
      get 'gen_objects'
      get 'image_info'
      get 'object_info'
    end
  end

  resources :context_screen_sizes


  resources :context_sample_types


  resources :context_recovery_methods


  resources :context_samples


  resources :context_inclusions


  resources :context_rank_orders


  resources :context_fine_sediments


  resources :context_feature_profile_shapes


  resources :context_feature_plan_shapes


  resources :context_features do
    collection do
      get 'context_ids'
    end
  end


  resources :sediment_colors


  resources :munsell_applied_colors


  resources :context_fine_sediment_textures


  resources :context_percentages


  resources :context_inclusion_sizes


  resources :context_inclusion_descriptions


  resources :context_stp_inclusions


  resources :context_stp_sediments


  resources :context_stp_levels


  resources :context_quadrat_boundaries


  resources :context_strat_rel_types


  resources :context_strat_rels


  resources :context_elevation_locations


  resources :context_open_closes


  resources :context_elevations


  resources :context_feature_types


  resources :context_unit_types


  resources :context_deposit_types


  resources :context_level_types


  resources :yes_nos


  resources :contexts do
    collection do
      get 'context_ids'
      get 'duplicate'
      get 'create_new_artifact'
      get 'features'
      get 'image_info'
      get 'object_info'
      get 'images'
      get 'gen_objects'
    end
  end

  resources :plantations


  resources :image_types


  resources :images do
    collection do
      get 'add_projects'
      get 'download'
    end
  end

  resources :editors


  resources :project_geo_coordinate_systems


  resources :project_geo_data


  resources :project_levelof_treatments


  resources :project_elevation_types


  resources :project_drainages


  resources :project_unitof_measures


  resources :project_place_names


  resources :project_regions


  resources :project_names


  resources :project_counties


  resources :project_institutions


  resources :project_countries


  resources :projects do
    collection do
      get 'images'
      get 'image_info'
      get 'object_info'
      get 'gen_objects'
    end
  end
  
  resources :users do
    collection do
      get 'all_projects'
    end
  end
  
  resources :homepage do
    collection do
      get 'dashboard'
      get 'about'
      get 'project_team'
      get 'partners'
      get 'sponsors'
      get 'research'
      get 'files'
      get 'reports'
      get 'activities'
      get 'test'
      get 'readings'
      get 'sqlqueries'
      get 'query'
      get 'artifact_query_five'
      post 'artifact_query_five'
      get 'artifact_query_five_public' => 'homepage#artifact_query_five'
      post 'search'
      post 'search_public' => 'homepage#search'
      get 'search'
      get 'artifact_query_one'
      post 'artifact_query_one'
      post 'search_one'
      get 'search_one'
      get 'artifact_query_two'
      post 'artifact_query_two'
      post 'search_two'
      get 'search_two'
      get 'artifact_query_three'
      post 'artifact_query_three'
      post 'search_three'
      get 'search_three'
      get 'artifact_query_four'
      post 'artifact_query_four'
      post 'search_four'
      get 'search_four'
      post 'create_message'
      get 'display_message'
      get 'all_messages'
      get 'date_sort_descending'
      get 'date_sort_ascending'
      get 'from_sort_descending'
      get 'from_sort_ascending'
      get 'subject_sort_descending'
      get 'subject_sort_ascending'
      get 'image_search'
      get 'image_search_action'
      post 'image_search_action'
      get 'context_query_one'
      post 'context_query_one'
      post 'search_context_one'
      get 'faunal_query_one'
      post 'faunal_query_one'
      post 'search_faunal_one'
      get 'search_faunal_one'
      get 'faunal_query_context'
      post 'faunal_query_context'
      post 'search_faunal_context'
      get 'faunal_query_feature_type'
      post 'faunal_query_feature_type'
      post 'search_faunal_feature_type'
      get 'aq_one'
      post 'aq_one'
      post 'aq_one_results'
      get 'aq_two'
      post 'aq_two'
      post 'aq_two_results'
      get 'aq_three'
      post 'aq_three'
      post 'aq_three_results'
      get 'query_objects'
      post 'query_objects'
      post 'query_objects_results'
      get 'query_context_one'
      post 'query_context_one'
      post 'query_context_one_results'
      get 'query_objects_two'
      post 'query_objects_two'
      post 'query_objects_two_results'
      get 'query_objects_three'
      post 'query_objects_three'
      post 'query_objects_three_results'
      get 'query_sites'
      post 'query_sites'
      post 'query_sites_results'
      get 'mcd_one'
      post 'mcd_one'
      post 'mcd_one_results'
      get 'mcd_two'
      post 'mcd_two'
      post 'mcd_two_results'
      get 'query_one_image'
      post 'query_one_image'
      post 'query_one_image_results'
      get 'query_two_image'
      post 'query_two_image'
      post 'query_two_image_results'
      get 'image_forms'
      get 'query_context_two'
      post 'query_context_two'
      post 'query_context_two_results'
      get 'query_faunal_two'
      post 'query_faunal_two'
      post 'query_faunal_two_results'
    end
  end
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepage#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
