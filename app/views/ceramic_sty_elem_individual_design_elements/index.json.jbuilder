json.array!(@ceramic_sty_elem_individual_design_elements) do |ceramic_sty_elem_individual_design_element|
  json.extract! ceramic_sty_elem_individual_design_element, :id
  json.url ceramic_sty_elem_individual_design_element_url(ceramic_sty_elem_individual_design_element, format: :json)
end
