Function1c0a0d: ; unreferenced
	ld a, b
	ld b, c
	ld c, a
	push bc
	push de
	ld hl, sp+2
	ld d, h
	ld e, l
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	pop bc
	ret

PrintHoursMins:
    push bc
    ld hl, sp+1
    push de
    push hl
    pop de
    pop hl
    lb bc, PRINTNUM_LEADINGZEROS | 1, 2
    call PrintNum

    ; Doppelpunkt drucken
    ld [hl], ":"
    inc hl

    ; Minuten drucken (zweistellig, mit führender Null)
    ld d, h
    ld e, l
    ld hl, sp+0
    push de
    push hl
    pop de
    pop hl
    lb bc, PRINTNUM_LEADINGZEROS | 1, 2
    call PrintNum

    pop bc
    ret

PrintHoursMins2:
; Hours in b, minutes in c
	ld a, b
	cp 12
	push af
	jr c, .AM
	jr z, .PM
	sub 12
	jr .PM
.AM:
	or a
	jr nz, .PM
	ld a, 12
.PM:
	ld b, a
; Crazy stuff happening with the stack
	push bc
	ld hl, sp+1
	push de
	push hl
	pop de
	pop hl
	ld [hl], " "
	lb bc, 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	ld d, h
	ld e, l
	ld hl, sp+0
	push de
	push hl
	pop de
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	ld de, String_AM2
	pop af
	jr c, .place_am_pm
	ld de, String_PM2
.place_am_pm
	inc hl
	call PlaceString
	ret

String_AM2: db "@"
String_PM2: db "@"

UpdateTimePredef::
	call UpdateTime
	ld hl, wDSTBackupDay
	ld a, [wCurDay]
	ld [hli], a ; wDSTBackupDay
	ldh a, [hHours]
	ld [hli], a ; wDSTBackupHours
	ldh a, [hMinutes]
	ld [hli], a ; wDSTBackupMinutes
	ldh a, [hSeconds]
	ld [hli], a ; wDSTBackupSeconds
	ret
