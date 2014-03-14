require 'fog/core/model'

module Fog
  module Identity
    class OpenStackCommon
      class Tenant < Fog::Model
        identity :id

        attribute :description
        attribute :enabled
        attribute :name

        def save
          requires :name
          identity ? update : create
        end

        def create
          data = service.create_tenant(attributes)
          merge_attributes(data.body['tenant'])
          self
        end

        # def update(options = nil)
        #   requires :id
        #   options.merge('id' => id)
        #   merge_attributes(
        #     service.update_tenant(self.id, options || attributes).body['tenant'])
        #   true
        # end
        #
        # def destroy
        #   requires :id
        #   service.delete_tenant(self.id)
        #   true
        # end
        #
        # def to_s
        #   self.name
        # end
        #
        # def roles_for(user)
        #   service.roles(
        #     :tenant => self,
        #     :user   => user)
        # end
        #
        # def users
        #   requires :id
        #   service.users(:tenant_id => self.id)
        # end
        #
        # def grant_user_role(user_id, role_id)
        #   service.add_user_to_tenant(self.id, user_id, role_id)
        # end
        #
        # def revoke_user_role(user_id, role_id)
        #   service.remove_user_from_tenant(self.id, user_id, role_id)
        # end

      end # class Tenant
    end # class OpenStack
  end # module Identity
end # module Fog
