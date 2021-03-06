{{/*
	This CC is a snippet for sorting an array of numbers descending or ascending.
	The array input is $arr. It is sorted in place.

	Currently, it sorts in DESC order, but this may be changed simply by changing the comparison on L13 to `gt` instead of `lt`.
*/}}

{{ $arr := cslice 1 5 23 5 6 7 }}
{{ $len := len $arr }}
{{- range seq 0 $len -}}
	{{ $min := . }}
	{{ range seq (add . 1) $len }}
		{{ if lt (index $arr $min) (index $arr .) }} {{ $min = . }} {{ end }}
	{{ end }}
	{{ if ne $min . }}
		{{ $ := index $arr . }}
		{{ $arr.Set . (index $arr $min) }}
		{{ $arr.Set $min $ }}
	{{ end }}
{{- end -}}
{{ $arr }}