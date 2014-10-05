class ContractsController < ApplicationController
def new
	@projects = Project.all
end
def create
  back_amount = contract_params["back"]
  campaign_id = contract_params["projid"]
  data = `serpent encode_datalist "'1' '#{campaign_id}'"`
  secret = "6ad0b58c60ea450544775b0f468097e140b709c041fe23f2a7ae2138dc691096"
  contract_address = "ab9998252af519f64e25668c5145ab4647d30e74"
  gas_price  = "10000000000000000"
  gas_amount = "4000"
  transaction_str = contract_address + " " + back_amount + " " + gas_price + " " + gas_amount + " " secret + " " + data
  `/home/colin/Documents/cpp-etherem/build/eth/eth transact #{transaction_str}`
  @contract = Contract.new(contract_params)
  @contract.save
  if @contract.save
  	@contract.custid = current_user.id
  	@proj = Project.find(@contract.projid)
  	if @proj.min > @contract.back
  		@contract.destroy
  	else
    @proj.pl = @proj.pl + @contract.back
  	@proj.backed = @proj.backed + 1
  	@contract.save
  	@proj.save
  	redirect_to @contract
  	end
  end
  
end

def show
  @contract = Contract.find(params[:id])
end

private
  def contract_params
    params.require(:contract).permit(:custid, :projid, :tx, :back)
  end
end


