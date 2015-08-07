json.array!(@ceramic_sty_elem_genres) do |ceramic_sty_elem_genre|
  json.extract! ceramic_sty_elem_genre, :id
  json.url ceramic_sty_elem_genre_url(ceramic_sty_elem_genre, format: :json)
end
