class Api::Partners::DiscountsController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  http_basic_authenticate_with name: "admin", password: "password"

  def index
    @discounts = Discount.all.with_rich_text_description

    render json: @discounts.map { |discount|
      {
        name:            discount.title,
        email:           discount.email,
        expiration_date: discount.expiration_date.to_s,
        description:     discount.description&.to_plain_text&.strip || "",
        image_url:       "#{request.base_url}#{discount.image_url}"      }
    }
  end
end
