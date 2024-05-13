class WishlistController < ApplicationController
    before_action :set_wishlist, only: [:show, :update, :destroy]

    def generate_pdf
        @wishlist = Wishlist.find(params[:id])
        pdf = WishlistPdf.new(@wishlist)
        send_data pdf.render, filename: "wishlist.pdf", type: "application/pdf"
    end

    def index
        @wishlists = Wishlist.all
        render json: @wishlists
    end

    def show
        render json: @wishlist
    end

    def create
        @wishlist = Wishlist.new(wishlist_params)

        if @wishlist.save
            render json: @wishlist, status: :created
        else
            render json: @wishlist.errors, status: :unprocessable_entity
        end
    end

    def update
        if @wishlist.update(wishlist_params)
            render json: @Wishlist
        else
            render json: @wishlist.errors, status: :unprocessable_entity
        end

    private

    def set_wishlist
        @wishlist = Wishlist.find(params[:id])
    end

    def wishlist_params
        params.require(:wishlist).permit(:name)
    end
end