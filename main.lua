--!strict
local uvm = {}

uvm.concat_tables = function(concat_to, ...)
	local tables,c_table = {...},concat_to or {}
	
	for i,v in tables do
		if type(i) == "number" then
			c_table[#c_table + 1] = v
		else
			c_table[i] = v
		end
	end

	return  c_table
end

uvm.ray_cast = function(from: Vector3, direction: Vector3, raycast_params): RaycastResult
	return workspace:Raycast(
		from,
		direction,
		raycast_params or nil
	)
end

uvm.get_mass = function(model : Model): number
	local mass: number = 0

	for _,v in pairs(model:GetDescendants()) do
		if v:IsA("BasePart") and not v.Massless then mass += v.Mass end
	end

	return mass
end

return uvm
