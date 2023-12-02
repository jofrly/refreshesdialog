class CustomersController < ApplicationController
   before_action :set_customer, only: %i[ edit update destroy ]

  def index
    @customers = Customer.order(name: :asc)
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path, notice: "Der Kunde wurde erstellt."
    else
      render turbo_stream: turbo_stream.replace(:dialog_content, partial: 'customers/form', locals: { customer: @customer }), status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: "Der Kunde wurde bearbeitet."
    else
      render turbo_stream: turbo_stream.replace(:dialog_content, partial: 'customers/form', locals: { customer: @customer }), status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy!

    redirect_to customers_path, notice: "Der Kunde wurde entfernt."
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :description)
  end
end
