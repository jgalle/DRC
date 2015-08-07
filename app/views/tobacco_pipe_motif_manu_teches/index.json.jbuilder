json.array!(@tobacco_pipe_motif_manu_teches) do |tobacco_pipe_motif_manu_tech|
  json.extract! tobacco_pipe_motif_manu_tech, :id, :MotifManuTech
  json.url tobacco_pipe_motif_manu_tech_url(tobacco_pipe_motif_manu_tech, format: :json)
end
