class SupplyRequestsController < ApplicationController
  def index
    @supply_requests = SupplyRequest.all
  end

  def new
    @supply_request = SupplyRequest.new
  end

  def create
    @supply_request = SupplyRequest.new(supply_request_params)
    @supply_request.user = User.first

    if @supply_request.save
      redirect_to @supply_request,
                  notice: "Supply request created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @supply_request = SupplyRequest.find(params[:id])
  end

  def approve
    @supply_request = SupplyRequest.find(params[:id])

    service = SupplyRequests::Approve.new(
      supply_request: @supply_request,
      approved_by: User.first
    )

    result = service.call

    if result.success?
      redirect_to result.supply_request,
                  notice: "Supply request approved successfully"
    else
      redirect_to result.supply_request,
                  alert: result.errors.to_sentence
    end
  end

  private

  def supply_request_params
    params.require(:supply_request).permit(
      :item_name,
      :quantity,
      :reason
    )
  end
end
