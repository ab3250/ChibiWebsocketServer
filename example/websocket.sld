(define-library (websocket)
  (import
    (scheme base))
  (export
    ws_sendframe_txt
    ws_sendframe_bin
    ws_sendframe
    ws_socket
    ws_get_state
    ws_getaddress
    ws_close_client
    ws_start)        	                
(include-shared "websocket"))
