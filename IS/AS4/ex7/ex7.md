Exercise 7. [1 point]
Purpose: Become familiar with the Kerberos protocol.
Explain how the protocol ensures that the authentication is completed within
the authentication’s allowed lifetime. Also explain why the client, in message
H, receives the encrypted timestamp.

Client/Server Session Key 
In message g, client sent the user ID with the timestamp t, Server Seesion decrypt the message g and send the new timestamp as t+1 (encrypted by Client/Server Session Key) in message H.
So the client can decrypt the message H to verify the new timestamp, if the timestamp is correct, the client can trust the server session.
Then the client can issuing the service request to the server.


In message G, the client sent the user ID with timestamp T. The server session decrypts message G and sends the new timestamp as T+1 (encrypted by the Client/Server Session Key) in message H. 

So, the client can decrypt message H to verify the new timestamp. If the timestamp is correct, the client can trust the server session. 

Then the client can proceed to issue the service request to the server.