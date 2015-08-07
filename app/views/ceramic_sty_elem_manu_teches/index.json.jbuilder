json.array!(@ceramic_sty_elem_manu_teches) do |ceramic_sty_elem_manu_tech|
  json.extract! ceramic_sty_elem_manu_tech, :id
  json.url ceramic_sty_elem_manu_tech_url(ceramic_sty_elem_manu_tech, format: :json)
end
