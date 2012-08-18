get_file() {
if [[ ! -f "$workingdir/$file" || "$forcedown" = "yes" ]]; then
	show_msg "Downloading from: $get"
	show_msg "Saving to: $file"
	notify_send "Downloading:" "Downloading $file, it may take some time depending on your connection"
	if [[ "$downagent" = "wget" ]]; then
		wget -c "$get" -O "$file"
	else
		curl -L -# "$get" -o "$file"
	fi
	if [[ -f "$workingdir/$file" ]]; then
		show_msg "Download successful!"
		if [[ "$keepdownloads" = "yes" ]]; then
			cp -f "$file" "$downloadsdir"
		fi
	else
		show_error "Error downloading $file!"
	fi
else
	show_msg "$file already present, skipping download"
fi
}