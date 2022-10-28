.model small
.stack 200h
.data
menu db '*********************MENU*********************$'
menu1 db 'Tekan 1 untuk sepeda$'
menu2 db 'Tekan 2 untuk mobil$'
menu3 db 'Tekan 3 untuk bus$'
menu4 db 'Tekan 4 untuk melihat data$'
menu5 db 'Tekan 5 untuk menghapus data$'
menu6 db 'Tekan 6 untuk keluar$'
msg1 db 'Parkir penuh$'
msg2 db '===Input salah===$'
msg3 db 'mobil$'
msg4 db 'bus$'
msg5 db 'data$'
msg6 db 'Ada tempat tersedia$'
msg7 db 'Total harga: Rp $'
msg8 db '- Jumlah kendaraan yang diparkir di lantai pertama = $'
msg9 db '- Jumlah kendaraan yang diparkir di lantai kedua = $'
msg10 db '- Jumlah sepeda yang diparkir di lantai pertama = $'
msg11 db '- Jumlah sepeda yang diparkir di lantai kedua = $'
msg12 db '- Jumlah mobil yang diparkir di lantai pertama = $'   
msg13 db '- Jumlah mobil yang diparkir di lantai kedua = $'
msg14 db '- Jumlah bus yang diparkir di lantai pertama = $'  
msg15 db '- Jumlah bus yang diparkir di lantai kedua = $'
msg16 db '===Data berhasil dihapus===$'
msg17 db 'Harga: Rp $'
msg18 db '==============================================$'
msg19 db '===Kendaraan berhasil diparkir===$'
mfloor1 db 'Tekan 1 untuk parkir di lantai pertama$'
mfloor2 db 'Tekan 2 untuk parkir di lantai kedua$'
amount dw 0
count dw '0'

r1 db '0'  
r2 db '0'
c1 db '0'
c2 db '0'
b1 db '0'
b2 db '0'
lantai1 dw  '0'
lantai2 dw  '0'

.code
main proc
mov ax,@data
mov ds,ax

;mov cx,count

;mov cx,0

while_:   

;Display menu dan pilihannya              
mov dx,10    
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu1
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu3
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu4
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset menu5
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu6
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h




;Mengambil input dari user
mov ah,1
int 21h
mov bl,al
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

;Membandingkan input untuk mengetahui perintah apa yang akan dijalankan
mov al,bl
cmp al,'1'
je rikshw
cmp al,'2'
je car
cmp al,'3'
je bus
cmp al,'4'
je rec
cmp al,'5'
je del
cmp al,'6'
je end_

;Error handling
mov dx,offset msg2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_

;Memanggil prosedur sesuai dengan input di atas
rikshw:
call sepeda


car:
call caar


rec:
call recrd


del:
call delt


bus:
call buss


;Memberhentikan program
end_:
mov ah,4ch
int 21h

main endp




;Fungsi jika input sepeda 
sepeda proc
;Display jika parkir penuh
cmp count,'4'
jle rikshw1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

;Display harga parkir sepeda
rikshw1:
mov dx,offset msg17
mov ah,9
int 21h
mov ax,1000
add amount, ax
mov dx,0 ; remainder is 0
mov bx,10 
mov cx,0

l2:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
        jne l2
   
l3:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l3 

;Menambah jumlah kendaraan dan memanggil prosedur lantai
inc count
mov cl,01H
call lantai

jmp while_
jmp end_

sepeda endp


;Fungsi jika input mobil
caar proc    
;Display jika parkir penuh    
cmp count,'4'
jle car1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_


;Display harga parkir mobil
car1:
mov dx,offset msg17
mov ah,9
int 21h

mov ax,1500
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l22:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l22
   
l33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l33

;Menambah jumlah kendaraan dan memanggil prosedur lantai
inc count
mov cl,02H
call lantai

jmp while_
jmp end_

caar endp


;Fungsi jika input bus
buss proc  
;Display jika parkir penuh
cmp count,'4'
jle bus1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

;Display harga parkir bus
bus1:
mov dx,offset msg17
mov ah,9
int 21h

mov ax,1500
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l222:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l222
   
l333:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l333

;Menambah jumlah kendaraan dan memanggil prosedur lantai
inc count
mov cl,03H
call lantai

jmp while_
jmp end_
buss endp


;Fungsi untuk menentukan parkir di lantai 1 atau 2
lantai proc
;Display menu lantai
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov dx,offset msg18
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset mfloor1
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h 

mov dx,offset mfloor2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

;Meminta input dari user
mov ah,1
int 21h
mov ch,al
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

;Membandingkan input untuk mengetahui perintah apa yang akan dijalankan
cmp ch,'1'
je lt1
cmp ch,'2'
je lt2

;Error handling
mov dx,offset msg2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_

;Membandingkan apakah input sebelumnya sepeda, mobil, atau bus (lantai 1)
lt1:
inc lantai1
cmp cl,01H
je lt1r
cmp cl,02H
je lt1c
cmp cl,03H
je lt1b

lt1r:
inc r1
jmp lantaiend

lt1c:
inc c1
jmp lantaiend

lt1b:
inc b1
jmp lantaiend

;Membandingkan apakah input sebelumnya sepeda, mobil, atau bus (lantai 2)
lt2:
inc lantai2
cmp cl,01H
je lt2r
cmp cl,02H
je lt2c
cmp cl,03H
je lt2b

lt2r:
inc r2
jmp lantaiend

lt2c:
inc c2
jmp lantaiend

lt2b:
inc b2
jmp lantaiend

;Display bahwa parkir sudah berhasil
lantaiend:
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov dx,offset msg19
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

jmp while_
jmp end_

lantai endp


;Fungsi untuk display data parkir
recrd proc
mov dx,offset msg7
mov ah,9
int 21h


;Display total harga
mov ax, amount
mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
        inc cx
        cmp ax,0
        jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

;Display berapa banyak kendaraan yang ada di parkiran
mov dx,offset msg8
mov ah,9
int 21h

mov dx,lantai1
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset msg9
mov ah,9
int 21h

mov dx,lantai2
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset msg10
mov ah,9
int 21h


mov dl,r1
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset msg11
mov ah,9
int 21h

mov dl,r2
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset msg12
mov ah,9
int 21h

mov dl,c1
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset msg13
mov ah,9
int 21h

mov dl,c2
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
 
 
mov dx,offset msg14
mov ah,9
int 21h

mov dl,b1
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
  

mov dx,offset msg15
mov ah,9
int 21h

mov dl,b2
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h  
  
jmp while_
jmp end_ 

recrd endp

;Menghapus data
delt proc
mov r1,'0'
mov c1,'0'
mov b1,'0'
mov r2,'0'
mov c2,'0'
mov b2,'0'
mov lantai1,'0'
mov lantai2,'0'
mov amount,0
mov count,'0'
mov dx,offset msg16
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

jmp while_
jmp end_
delt endp
   
end main