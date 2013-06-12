ActiveAdmin.register Page do

  show do
    attributes_table do
      row :title
      row :slug
      row :body do
        markdown(page.body)
      end
    end
  end
end
