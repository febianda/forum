class AddForumPostsCounterToForumThreads < ActiveRecord::Migration[6.1]
  def up
    add_column :forum_threads, :forum_posts_count, :integer, default: 0

    ForumThread.all.each do |t|
      ForumThread.reset_counters(t.id, :forum_posts)
    end
  end

  def down
    remove_column :forum_threads, :forum_posts_count
  end
end
