class InvitationsController < ApplicationController
  skip_before_action :set_current_user, :authenticate_request,
  only: [:create]
  def index
    @invitations = Invitation.all
    render json: @invitations
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      render json: @invitation, status: :created
    else
      render json: @invitation.errors , status: :unprocessable_entity
    end

  end
  private

    def invitation_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
class InvitationSerializer < ActiveModel:: Serializer
  attributes :email
end
