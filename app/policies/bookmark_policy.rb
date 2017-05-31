class BookmarkPolicy < ApplicationPolicy
  def update
    record.topic.user == user
  end
  
  def destroy
    record.topic.user == user
  end
end
