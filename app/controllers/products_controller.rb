class ProductsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @products = Product.all.order("created_at DESC")

    render json: {
      total_items: @products.size,
      products: @products
    }
  end

  def list_products
    @products = Product.all.order("created_at DESC")

    respond_to do |format|
      format.html
    end
  end

  def create
    if params_missing?
      return render json: { message: "invalid or missing params" }, status: 422
    else
      @product = Product.create(product_params)
      render json: {
        message: "product created",
        product: @product
      }
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @product.blank?
      return render json: { message: "product not found" }, status: 404
    else
      render json: @product
    end
  end

  def update
    @product = Product.find_by(id: params[:id])

    return render json: {message: "invalid or missing params"} if params_missing?

    if @product.blank?
      return render json: { message: "product not found" }, status: 404
    else
      @product.update(product_params)

      render json: {
        message: "product updated",
        product: @product
      }
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])

    if @product.blank?
      return render json: { message: "product not found" }, status: 404
    else
      @product.delete

      render json: {
        message: "product deleted",
        product: @product
      }
    end
  end

  private
  def params_missing?
    product_params.nil? || product_params[:name].nil? || product_params[:price].nil?
  end

  def product_params
    params.permit(:name, :price)
  end
end
