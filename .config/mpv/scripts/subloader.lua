local utils = require 'mp.utils'

function subloader()
	path = mp.get_property("path")
	srt_path = string.gsub(path, "%.%w+$", ".srt")
	t = { args = { "subliminal", "download", "-s", "-l", "en", path } }

	mp.osd_message("Searching")
	res = utils.subprocess(t);
	if res.error == nil then
    	if mp.commandv("sub_add", srt_path) then
      		mp.msg.warn("Subtitle download succeeded")
			mp.osd_message("Subtitle '" .. srt_path .. "' download succeeded")
    	else
			mp.msg.warn("Subtitle download failed")
			mp.osd_message("Subtitle download failed")
    	end
  	else
		mp.msg.warn("Subtitle download failed")
		mp.osd_message("Subtitle download failed")
	end
end

mp.add_key_binding("b", "subloader", subloader)
