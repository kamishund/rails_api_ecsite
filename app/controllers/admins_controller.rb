class AdminsController < ApplicationController

    def index
      admin = User.all
      admin_array = admin.map do |product|
        {
          id: product.id,
          name:product.name,
          admin:product.admin,
          email: product.email,
      }
      end
      render json: admin_array, status: 200
    end

    def show
        admin = User.find(params[:id])
        admin_array = 
          {
            id: admin.id,
            name:admin.name,
            admin:admin.admin,
            email: admin.email,
        }
        render json: admin_array, status: 200
    end

    def create
        admin = Admin.new(user_id:params[:adminId])
        if admin.save
          render json: {user_id: admin.user_id, admin: admin.admin, message: '成功しました' }, status: 200
        else
          render json: { message: '保存出来ませんでした', errors: admin.errors.messages }, status: 400
        end
    end

    def update
        user = User.find(params[:id])  
        admin = Admin.find_by(user_id: params[:id])  
        admin.update(admin:params[:admin])
        
        if admin.save and user.save
            render json: { admin: admin, message: '成功しました' }, status: 200
          else
            render json: { message: '保存出来ませんでした', errors: admin.errors.messages }, status: 400
        end
    end

    def destroy
      product = User.find(params[:id])
      product.destroy
  end

    def summary
      usersCount  = User.count
      productsCount  = Product.count
      ordersCount  = Order.count
      ordersPrice  = Order.all.sum(:totalPrice)

      render json: {usersCount: usersCount, productsCount: productsCount, ordersCount: ordersCount,ordersPrice: ordersPrice}, status: 200

    end
end
