module SupplyRequests
  class Approve
    Result = Struct.new(
      :success?,
      :supply_request,
      :errors,
      keyword_init: true
    )

    def initialize(supply_request:, approved_by:)
      @supply_request = supply_request
      @approved_by = approved_by
    end

    def call
      return failure("Supply request is already approved") if @supply_request.status == "approved"

      old_status = @supply_request.status

      @supply_request.status = "approved"
      @supply_request.approved_by = @approved_by
      @supply_request.approved_at = Time.current

      if @supply_request.save
        AuditLog.create!(
          user: @approved_by,
          auditable: @supply_request,
          action: "approved",
          old_value: old_status,
          new_value: @supply_request.status
        )

        success
      else
        failure(@supply_request.errors.full_messages)
      end
    end

    private

    def success
      Result.new(
        success?: true,
        supply_request: @supply_request,
        errors: []
      )
    end

    def failure(errors)
      Result.new(
        success?: false,
        supply_request: @supply_request,
        errors: Array(errors)
      )
    end
  end
end
