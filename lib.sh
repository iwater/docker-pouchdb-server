#!/bin/sh

function randomPass() {
	date +%s | sha256sum | base64 | head -c ${1:-16}
}

function jsonValue() {
	KEY=$1
	num=$2
	awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}
