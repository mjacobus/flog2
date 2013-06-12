ActiveAdmin.register Page do

  index do 
    column :title
    column :slug
    column :menu_order
    column :updated_at

    default_actions
  end
  
  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :menu_order, as: :select, collection: 1..20
      f.input :body
    end

    f.buttons
  end

  show do
    attributes_table do
      row :title
      row :slug
      row :menu_order
      row :body do
        markdown(page.body)
      end
    end
  end
end
