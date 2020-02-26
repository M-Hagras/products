class SearchProducts
  def initialize(params, pagination_size)
    @department_id = params[:department_id]
    @promotion_id = params[:promotion_id]
    @product_text = params[:product_text]
    @page_num = params[:page]
    @pagination_size = pagination_size
  end

  def execute
    if @department_id.blank? && @promotion_id.blank? && @product_text.blank?
      return OpenStruct.new(success?: false)
    end
    query_string = generate_query_string(@department_id, @promotion_id, @product_text)
    products = if @promotion_id.blank?
                 Product.where(query_string).page(@page_num).per(@pagination_size)
               else
                 Product.joins(:promotions).where(query_string).page(@page_num).per(@pagination_size)
               end
    OpenStruct.new(success?: true, products: products, page: @page_num,
                   total_pages: products.total_pages)
  end

  private

  def generate_query_string(department_id, promotion_id, product_text)
    filters = ''
    filters += "department_id=#{department_id}" unless department_id.blank?
    unless promotion_id.blank?
      filters += filters.blank? ? "promotion_id=#{promotion_id}" : " AND promotion_id=#{promotion_id}"
    end
    unless product_text.strip.blank?
      search_regex = "name LIKE '%#{product_text}%'"
      filters += filters.blank? ? search_regex : " AND #{search_regex}"
    end
    filters
  end
end