module SupplyRequests
  class Approve
    def initialize(supply_request:, approved_by:)
      @supply_request = supply_request
      @approved_by = approved_by
    end

    def call
      @supply_request.status = "approved"
      @supply_request.approved_by = @approved_by
      @supply_request.approved_at = Time.current

      @supply_request.save
    end
  end
end
