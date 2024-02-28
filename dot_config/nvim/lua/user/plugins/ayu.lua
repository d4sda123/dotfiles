local ayu_status, ayu = pcall(require, "ayu")
if not ayu_status then
    return
end

ayu.setup {}
