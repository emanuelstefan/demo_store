class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")

    respond_to do |format|
      format.html
      format.json { render json: { products: @products } }
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def edit
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def delete
    @product = Product.find(params[:id])
    @product.delete

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  private
  def product_params
    params.permit(:name, :price)
  end
end
