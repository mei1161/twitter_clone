ActiveAdmin.register TweetText do
  permit_params :content, :user_id, :reply_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :user_id, :type, :reply_id, :deleted_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :user_id, :type, :reply_id, :deleted_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :created_at
  filter :user

  index do
    selectable_column
    id_column
    column :screen_name do |tweet|
      tweet.user.screen_name
    end
    column :content
    column :created_at
    column :reply
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :reply_id
      f.input :content
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :content
      row :reply
    end
  end
end
