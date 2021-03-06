class ProjectsController < ApplicationController
def new
end
def create
  target_amount = contract_params["target"]
  user_id = current_user.ethid
  seconds = contract_params["exp"] - Time.now
  data = `serpent encode_datalist "'0' '#{user_id}' '#{seconds}' 'target_amount'"`
  #curl -X POST --data '{"method":"transact","params":{"xEndowment":"","bCode":"300580600b60003960105860026001576000f1","sec":"6ad0b58c60ea450544775b0f468097e140b709c041fe23f2a7ae2138dc691096","xGas":"700","xGasPrice":"10000000000000"},"jsonrpc":"2.0","id":"1"}' http://localhost:8080
  
  secret = "6ad0b58c60ea450544775b0f468097e140b709c041fe23f2a7ae2138dc691096"
  contract_address = "ab9998252af519f64e25668c5145ab4647d30e74"
  gas_price  = "10000000000000000"
  gas_amount = "4000"
  transaction_str = "curl -X POST --data '{\"method\":\"transact\", \"params\":{\"sec\":\"#{secret}\",\"xValue\":\"0\",\"aDest\":\"#{contract_address}\",\"bData\":\"#{data}\",\"xGas\":\"#{gas_amount}\",\"xGasPrice\":\"#{gas_price}\"}, \"jsonrpc\":\"2.0\", \"id\":2}'"
  #transaction_str = contract_address + " " + target_amount + " " + gas_price + " " + gas_amount + " " secret + " " + data
  #{`/home/colin/Documents/cpp-etherem/build/eth/eth transact #{transaction_str}`
  `transaction_str`
  @project = Project.new(project_params)
  @project.save
  if @project.save
  	@project.backed = 0
    @project.pl = 0
  end
  @project.save
  redirect_to @project
end

def show
  @project = Project.find(params[:id])
end

private
  def project_params
    params.require(:project).permit(:title, :desc, :backed, :roll, :exp, :min, :target, :ethercode, :pl)
  end
end