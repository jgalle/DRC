json.array!(@ceramic_sty_elem_individual_designs) do |ceramic_sty_elem_individual_design|
  json.extract! ceramic_sty_elem_individual_design, :id
  json.url ceramic_sty_elem_individual_design_url(ceramic_sty_elem_individual_design, format: :json)
end
