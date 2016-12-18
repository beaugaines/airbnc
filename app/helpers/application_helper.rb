module ApplicationHelper
    def find_user(id)
        User.find(id)
    end
end
