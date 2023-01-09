local hlargs_status, hlargs = pcall(require, "hlargs")
if not hlargs_status then
	return
end

hlargs.setup()
