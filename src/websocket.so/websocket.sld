(define-library (websocket)
  (import
    (scheme base))
  (export
    ws_sendframe_txt
    ws_sendframe_bin
    ws_socket
    ws_start)        	                
(include-shared "websocket"))
