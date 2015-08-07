class BoneElement < ActiveRecord::Base
  self.table_name = 'tblBoneElement'
  self.primary_key = 'BoneElementID'
  # #attr_accessible :body_part, :bone_element
end
