#!/bin/sh

function random_pass() {
	date +%s | sha256sum | base64 | head -c ${1:-16}
}

function json_value() {
	KEY=$1
	NUM=$2
	awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' |
		tr -d '"' |
		sed -n ${NUM}p

}
