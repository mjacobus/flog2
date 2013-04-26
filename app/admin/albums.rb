ActiveAdmin.register Album do

  index do
    column :picture do |album|
      picture = album.pictures.first
      if picture
        link_to admin_album_picture_url(album, picture) do
          image_tag album.pictures.first.file.url(:thumb)
        end
      end
    end
    column :title
    column :category
    column :slug
    column :created_at
    column :updated_at
    
    default_actions
  end 
  
  show do
    attributes_table do
      row :title
      row :slug
      row :body do
        simple_format album.body
      end
      row :pictures do
        render 'pictures'
      end
    end
  end

  member_action :reorder_pictures, method: :post do
    album = Album.find(params[:id])
    params[:picture_ids].each_with_index do |id, index|
      picture = album.pictures.find(id)
      picture.sequence = index
      picture.save
    end
    render text: :ok
  end
  
end
