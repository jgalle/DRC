json.array!(@ceramic_sty_elem_meta_data) do |ceramic_sty_elem_meta_datum|
  json.extract! ceramic_sty_elem_meta_datum, :id
  json.url ceramic_sty_elem_meta_datum_url(ceramic_sty_elem_meta_datum, format: :json)
end
