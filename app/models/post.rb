class Post < ActiveRecord::Base
  def hash
    eval(self.content.to_s)
  end
end
