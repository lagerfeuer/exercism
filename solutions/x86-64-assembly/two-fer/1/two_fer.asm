; asmsyntax=nasm
section .rodata
msg: db "One for ", 0x1A, ", one for me.", 0
you: db "you", 0

section .text
global two_fer
  ; ARGS
  ;     char* name   - rdi
  ;     char* output - rsi
two_fer:
  mov rdx, rdi  ; name buffer
  mov rax, rsi  ; dst buffer
  mov rbx, msg  ; message buffer

;;; strcat msg_start
copy_loop:
  mov cl, [rbx]       ; load msg[idx]
  inc rbx             ; idx++

  cmp cl, 0x1A        ; if msg[idx] == 0x1A
  je subst            ; then SUBST

  mov [rax], cl       ; dst[idx] = msg[idx]
  inc rax             ; idx++

  cmp cl, 0           ; if msg[idx] == NULL
  je done             ; then DONE
  jmp copy_loop       ; LOOP


subst:
  cmp rdx, 0      ; if name == NULL
  jne subst_loop
  mov rdx, you    ; then rdx = "you"

;;;;;;;; BUG ;;;;;;;;
subst_loop:
  mov cl, [rdx]
  cmp cl, 0
  je copy_loop

  mov [rax], cl
  inc rax
  inc rdx
  jmp subst_loop


;;; set return value
done:
  mov rax, rsi

  ret
