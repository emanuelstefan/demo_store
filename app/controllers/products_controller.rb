class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")

    render json: { products: @products }
  end

  def list_products
    @products = Product.all.order("created_at DESC")

    respond_to do |format|
      format.html
    end
  end

  def show
    @product = Product.find(params[:id])

    render json: @product
  end

  def edit
    @product = Product.find(params[:id])

    render json: @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)

    render json: @product
  end

  def delete
    @product = Product.find(params[:id])
    @product.delete

    render json: @product
  end

  private
  def product_params
    params.permit(:name, :price)
  end
end
