out_0=alsa_output.platform-bcm2835_audio.stereo-fallback
out_1=alsa_output.platform-bcm2835_audio.stereo-fallback.2

pacmd_out=$(pacmd list-sinks | grep -e '* index:' | awk '{printf $3}')

if (( $pacmd_out == 0 )); then
	echo $pacmd_out
	pacmd "set-default-sink $out_1"
elif (( $pacmd_out == 1 )); then
	echo $pacmd_out
	pacmd "set-default-sink $out_0"
fi

