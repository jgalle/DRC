json.array!(@ceramic_sty_elem_dec_teches) do |ceramic_sty_elem_dec_tech|
  json.extract! ceramic_sty_elem_dec_tech, :id
  json.url ceramic_sty_elem_dec_tech_url(ceramic_sty_elem_dec_tech, format: :json)
end
