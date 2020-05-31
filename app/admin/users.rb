ActiveAdmin.register User do
  permit_params :email, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :screen_name, :name, :biography, :birthday

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :screen_name, :name, :biography, :birthday, :deleted_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :screen_name, :name, :biography, :birthday, :deleted_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :email
  filter :screen_name
  filter :name
  filter :birthday
  filter :reset_password_sent_at
  filter :remember_created_at
  filter :confirmed_at
  filter :confirmation_sent_at
  filter :unconfirmed_email

  index do
    selectable_column
    id_column
    column :email
    column :screen_name
    column :name
    column :biography
    column :birthday
  end

  show do
    attributes_table do
      row :email
      row :screen_name
      row :name
      row :biography
      row :birthday
      row :reset_password_sent_at
      row :remember_created_at
      row :confirmed_at
      row :confirmation_sent_at
      row :unconfirmed_email
    end
  end

   form do |f|
    inputs  do
      input :email
      input :name
      input :screen_name
      input :password
      input :password_confirmation
    end
    actions
  end

  csv do
    column :id
    column :email
    column :screen_name
    column :name
    column :biography
    column :birthday
    column :reset_password_sent_at
    column :remember_created_at
    column :confirmed_at
    column :confirmation_sent_at
    column :unconfirmed_email
  end

end
