class SecretsController < ApplicationController

  def index
    @secrets = Secret.all
    render json: @secrets
  end
end

class SecretSerializer < ActiveModel::Serializer
  attributes :text
end
