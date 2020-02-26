module Api::V1
  class ProductsController < ApplicationController
    require 'search_products'

    before_action :set_product, only: [:show, :update, :destroy]

    # GET /products
    # noinspection RailsChecklist01
    def index
      @pagination_size = @pagination_size || 25
      page_num = params[:page_num] || 1
      @products = Product.includes(:promotions, :department).page(page_num).per(@pagination_size)

      render json: {
          products: @products.as_json(:include => [:department, :promotions]),
          page: page_num.to_i,
          pages: @products.total_pages
      }
    end

    # #Searching products 
    # Supported Filter: Department by id, Promotion by id, Product by name
    # @return list of products
    def search_products
      # TODO: populating pagination_size from user
      @pagination_size = @pagination_size || 25
      result_search = SearchProducts.new(params.slice(:department_id, :promotion_id, :product_text, :page), @pagination_size).execute
      unless result_search.success?
        return index
      end
      render json: {
          products: result_search.products ? result_search.products.as_json(:include => [:department, :promotions]) : [],
          page: result_search.page_num.to_i,
          pages: result_search.total_pages
      }
    end

    # GET /products/1
    def show
      render json: @product
    end

    # POST /products
    def create
      @product = Product.new(product_params)

      if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # DELETE /products/1
    def destroy
      @product.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :price, :department_id)
    end
  end
end