ActiveAdmin.register Font do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  permit_params %w[font_family font_size heart_font_family heart_font_size star_font_family star_font_size cross_font_family cross_font_size]

  form do |f|
    f.inputs do
      f.input :font_family, as: :select, collection: Font.sel_families
      f.input :font_size
      f.input :heart_font_family, as: :select, collection: Font.sel_families
      f.input :heart_font_size
      f.input :star_font_family, as: :select, collection: Font.sel_families
      f.input :star_font_size
      f.input :cross_font_family, as: :select, collection: Font.sel_families
      f.input :cross_font_size
      f.submit
    end
  end

end
