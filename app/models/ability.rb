class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    can :manage, :all do 
        user.admin
    end
    can :see_other, User do |u|
        user.admin
    end
    can :update, Project, :creator_id => user.id
    can :index, User do |u|
        user.admin == true
    end
    can :create, UserStory do |user_story|
        user_story.project.creator_id == user.id
    end

    can :show, Project do |project|
        user.projects.include? project
    end
    can :set_completed, UserStory, :project => {:creator_id => user.id}
    can :update, UserStory, :project => {:creator_id => user.id}
    can :show, UserStory do |user_story|
        user_story.users.include?(user)
    end
    can :show, UserStory do |user_story|
                (user_story.project.creator_id == user.id)   
    end

  end
end
