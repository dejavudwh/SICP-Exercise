#lang scheme

; 当只有b被设置值时，不能得到正确答案
; 因为当b被设置值时，a丢失了值，但是乘法约束要更新值至少需要知道两个值