json.array!(@ceramic_sty_elem_wares) do |ceramic_sty_elem_ware|
  json.extract! ceramic_sty_elem_ware, :id
  json.url ceramic_sty_elem_ware_url(ceramic_sty_elem_ware, format: :json)
end
