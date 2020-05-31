ActiveAdmin.register TweetRetweet do
  actions :all, except: %i[new edit]
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

  filter :user
  filter :created_at

  index do
    selectable_column
    id_column
    column :retweet do |ad|
       ad.retweet.tweet
    end
    column :screen_name do |tweet|
      tweet.user.screen_name
    end
    column :created_at 
  end
end
