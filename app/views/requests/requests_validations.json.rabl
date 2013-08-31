node :cols do
	:requests => "Requests", :validations => "Validations"
end
node :rows do
	collection @requests
	attributes :total_requests
end