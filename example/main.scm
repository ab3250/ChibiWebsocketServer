(import
    (scheme base)
    (scheme red)
    (chibi time)    
    (websocket))

(define gblFd -1)
(define port 8080)
(define nonblocking 1)

(define (delay sec)
    (define start (current-seconds))
    (let timeloop ()    
        (if ( < (- (current-seconds) start) sec) (timeloop))))

(define-syntax unless
  (syntax-rules ()
    ((unless test . body)
     (when (not test) . body))))

(define (onclose fd)
    (display (list 'closed fd))
    (newline)
    (set! fd -1))

(define (onopen fd)
    (set! gblFd fd)
    (display (list 'opened fd))   
    (newline))

(define (closeconn fd)
    ws_close_client(fd))

(define (ws_send_txt msg)
    (ws_sendframe_txt gblFd msg #f)
    (display (list 'frame 'sent 'client gblFd))
    (newline))

(define (onmessage fd msg size type)    
    (display (list 'frame 'recieved 'client fd))
    (newline)
    (ws_send_txt msg)) ;echo

(define (main args)
    (ws_start)
    (let loop ((count 0))   
        (delay 1)                
        (unless (equal? gblFd -1)(ws_send_txt (number->string count)))
        (ws_close_client gblFd)
   (loop (+ count 1))))