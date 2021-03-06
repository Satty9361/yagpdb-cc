{{/*
	Simple world clock. Usage: `-worldclock`.
	Recommended trigger: Command trigger with trigger `worldclock`.
*/}}

{{ $clocks := sdict
	"Vancouver" "America/Vancouver"
	"New York" "America/New_York"
	"London" "Europe/London"
	"Moscow" "Europe/Moscow"
	"Tokyo" "Asia/Tokyo"
}}
{{ $hour := .TimeHour }}

{{ $embed := sdict
	"title" "🕰️ World Clock"
	"fields" cslice
	"color" 0x0070BB
	"footer" (sdict "text" "Your time")
	"timestamp" currentTime
}}

{{ range $name, $ := $clocks }}
	{{ $time := currentTime.In (newDate 0 0 0 0 0 0 .).Location }}
	{{ $formatted := printf "%s, %s"
		$time.Weekday.String
		($time.Format "3:04:05 PM")
	}}
	{{ $embed.fields.Append (sdict
		"name" $name
		"value" $formatted
	) | $embed.Set "fields" }}
{{ end }}

{{ sendMessage nil (cembed $embed) }}