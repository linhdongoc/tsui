module Auth
  class RegistrationsController < Devise::RegistrationsController
    def create
      super { |resource| resource.update_column(:role, 0) if resource.persisted? }
    end
  end
end
