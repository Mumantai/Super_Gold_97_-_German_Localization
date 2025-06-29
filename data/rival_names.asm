RivalNameMenuHeader:
	db STATICMENU_NO_TOP_SPACING
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NAME@"

RivalNameArray:
	db "SILBER@"
	db "PHILLIP@"
	db "OSCAR@"
	db "MAX@"

	db 2
	db "NAME@" ; title
