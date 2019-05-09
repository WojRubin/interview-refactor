class ChangeEpisodes < ActiveRecord::Migration[5.2]
  def change
  	rename_column :episodes ,:episode ,:episode_no
  end
end
