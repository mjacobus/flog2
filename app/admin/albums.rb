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
    column :slug
    column :created_at
    column :updated_at
    
    default_actions
  end 

  
  show do
    h3 album.title
    simple_format album.body
    div do
      simple_format album.body
    end

    render 'pictures'
  end
  
end
