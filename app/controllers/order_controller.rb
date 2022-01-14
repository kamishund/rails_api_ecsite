class OrderController < ApplicationController
  before_action :authenticate_user!, only: ['create','history']

    def create
        itemOrder = order_params;
        admin = Order.new(
            user_id:  current_user.id,
            paymentMethod: itemOrder["paymentMethod"],
            itemsPrice: itemOrder["itemsPrice"],
            shippingPrice:itemOrder["shippingPrice"],
            taxPrice:itemOrder["taxPrice"],
            totalPrice: itemOrder["totalPrice"],
            isPaid: false,
            isDelivered: false,
        );

        ship=admin.build_adress(
        #    order_id: admin.id,
           fullName: itemOrder[:shippingAddress][:fullName],
           address:itemOrder[:shippingAddress][:address],
           city: itemOrder[:shippingAddress][:city],
           postalCode:itemOrder[:shippingAddress][:postalCode],
           country:itemOrder[:shippingAddress][:country],
        );
        
        
         itemOrder[:orderItems].map do |item|
           sampkle =  admin.orderitems.build(
                name: item[:name],
                image: item[:image][:url],
                price:item[:price],
                quantity: item[:quantity],
             );
             sampkle.save
        end

        if admin.save and ship.save
          render json: {
              data: admin, 
              message: '成功しました' 
              
              }, status: 200
        else
          render json: { message: '保存出来ませんでした', errors: admin.errors.messages }, status: 400
        end
    end

    def index
      order = Order.all
      render json: order, status: 200
    end

    def show
      order = Order.find(params[:id])
      shippingAddress = Adress.find_by(order_id:params[:id])
      orderItems = Orderitem.where(order_id:params[:id])
      render json:{
        id:order.id,
        shippingAddress: shippingAddress,
        orderItems: orderItems,
        paymentMethod:order.paymentMethod,
        itemsPrice:order.itemsPrice,
        taxPrice:order.taxPrice,
        shippingPrice:order.shippingPrice,
        totalPrice:order.totalPrice,
        isPaid:order.isPaid,
        paidAt:order.paidAt,
        isDelivered:order.isDelivered,
        deliveredAt:order.deliveredAt,
      }, status: 200
  end

  def pay
    order = Order.find(params[:id])
    t = Time.now
    strTime = t.strftime("%B,%d %H時 %M分")
    order.update(isPaid: true, paidAt:strTime)

    result=order.build_payment_result(status:params[:status], emailAddress:params[:email])

    if order.save and result.save
      render json: {
          # data: admin, 
          message: '成功しました' 
          
          }, status: 200
    else
      render json: { message: '保存出来ませんでした', errors: order.errors.messages }, status: 400
    end
  end

  def history
    order = Order.where(user_id:current_user.id)
    render json: order, status: 200
  end

  def delivered
    order = Order.find(params[:id])
    t = Time.now
    strTime = t.strftime("%B,%d %H時 %M分")
    order.update(isDelivered: true, deliveredAt:strTime)
    if order.save
      render json: {
          message: '成功しました' 
          
          }, status: 200
    else
      render json: { message: '保存出来ませんでした', errors: order.errors.messages }, status: 400
    end
  end



    private

        def order_params
        params.permit(
             :paymentMethod,
             :itemsPrice, 
             :shippingPrice, 
             :taxPrice,
             :totalPrice,
             shippingAddress: [
                :fullName,
                :address,
                :city, 
                :postalCode,
                :country,
             ], 
             orderItems: [
                 :id,
                 :name,
                 :slug,
                 :category,
                 :price,
                 :brand,
                 :rating,
                 :numReviews,
                 :countInStock,
                 :description,
                 :quantity,
                 image:[:url],
            ],
            )
        end

end
