ActiveAdmin.register Picture do
  belongs_to :album

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :sequence
      f.input :description
      f.input :file, :as => :file,
        :hint => (f.template.image_tag(f.object.file.url(:medium)) if f.object.file?)
    end
    
    f.buttons
  end


  show do |picture|
    attributes_table_for picture do
      row :title
      row :file do 
        img :src => picture.file.url(:big)
      end
      
      row :description
      row :sequence
    
      row :created_at
      row :updated_at
    end
  end
end