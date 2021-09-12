module UserService
  module Update
    extend self

    def update_age(user, age_param)
      user.update(age: age_param)
    end

    def update_description(user, description_param)
      user.update(description: description_param)
    end
  end
end
