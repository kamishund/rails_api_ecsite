class ProductsController < ApplicationController
    def index
        products = Product.all
        products_array = products.map do |product|
        {
            name:product.name,
            slug:product.slug,
            category:product.category,
            image:product.image,
            price:product.price,
            brand:product.brand,
            rating:product.rating,
            numReviews:product.numReviews,
            countInStock:product.countInStock,
            description:product.description,
            created_at: product.created_at,

            id:product.id,
        }
        end
      render json: products_array, status: 200
    end

    def show
        products = Product.find(params[:id])
        render json: products, status: 200
    end

    def create
        product = Product.new()
    
        if product.save
          render json: {id: product.id, message: '成功しました' }, status: 200
        else
          render json: { message: '保存出来ませんでした', errors: product.errors.messages }, status: 400
        end
    end

    def destroy
        product = Product.find(params[:id])
        product.destroy
    end

    def update
        product = Product.find(params[:id])  
        if params[:image]
            product.update(
                name: params[:name],
                slug: params[:slug],
                price: params[:price],
                category: params[:category],
                brand: params[:brand],
                countInStock: params[:countInStock],
                description: params[:description],
                image: params[:image],
            ) 
        else
            product.update(
                name: params[:name],
                slug: params[:slug],
                price: params[:price],
                category: params[:category],
                brand: params[:brand],
                countInStock: params[:countInStock],
                description: params[:description],
            ) 
        end
        
    end

    private
    def item_params
      params.require(
          :name,
          :slug,
          :price,
          :category,
          :brand,
          :countInStock,
          :description,
          :image,
    )
    end

end
