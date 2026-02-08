class DiscountsController < ApplicationController
  def index
    @discounts = Discount.all.order(created_at: :desc)
    @discount = Discount.new
  end

  def create
  @discount = Discount.new(discount_params)

    if @discount.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path }
      end
    else
      @discounts = Discount.all.with_rich_text_description

      render :index, status: :unprocessable_entity
    end
  end

  private
  def discount_params
    params.require(:discount).permit(:title, :email, :description, :expiration_date, :image)
  end
end