var _lines = 0;
var _f = file_text_open_read(working_directory + string("Cruisers/Cruisers.txt"));
while (!file_text_eof(_f)) {
	
	var _g = file_text_read_string(_f)
	show_debug_message(string("Download = ")+string(_g));
	http_get_file(_g,string("Cruisers/Cruiser_")+string(_lines)+string(".ini"));
	
	
    file_text_readln(_f);
    _lines++;
	

	
}
file_text_close(_f);
alarm[1] = 30;





