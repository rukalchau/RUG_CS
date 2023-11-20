# Web Foundation Queries

## Answers

1. **What is the Web?**
   - The Web, or the World Wide Web, is a system of interconnected documents and resources linked by hyperlinks and URLs, accessed via the Internet using web browsers. It consists of a vast collection of textual and multimedia content.

2. **How do URLs work?**
   - URLs (Uniform Resource Locators) are the addresses for web resources on the Internet. They specify the location of a resource, the protocol used to access it, and the method to retrieve it.

3. **How are resources connected to each other by links?**
   - Resources on the Web are connected through hyperlinks. These links can point to entire documents or specific elements within a document, allowing easy navigation from one resource to another.

4. **What is the difference between the Web and the Internet?**
   - The Internet is a global network of interconnected computers using TCP/IP protocols, while the Web is a service on the Internet, consisting of web pages accessed via HTTP.

5. **What is the TCP/IP model?**
   - The TCP/IP model is a set of communication protocols used on the Internet, divided into four layers: the link layer, the internet layer, the transport layer, and the application layer. TCP ensures reliable data transmission, and IP handles packet routing.

6. **What is HTTP?**
   - HTTP (Hypertext Transfer Protocol) is the primary protocol for data transfer on the Web. It is a request-response protocol in the client-server model, defining how messages are formatted and transmitted.

7. **What is the difference between a server and an origin server in HTTP?**
   - A server in HTTP is any machine that responds to client requests. An origin server specifically hosts the original version of a requested resource and is the ultimate source of the data.

8. **What is a proxy in HTTP?**
   - A proxy in HTTP is an intermediary server between a client and the server. It can perform functions like caching, filtering, or bypassing IP restrictions, forwarding requests to the appropriate server.

9. **What is a gateway in HTTP?**
   - An HTTP gateway connects two different networks, often involving a translation of protocols. It serves as an entry point from an HTTP network to a non-HTTP network.

10. **What is a tunnel in HTTP?**
    - An HTTP tunnel is used to transport requests through incompatible networks. It encapsulates a payload protocol, providing secure communications through an unsecured network.

# Web Foundation Queries: Detailed Answers

## Answers

1. **What is content negotiation?**
   - Content negotiation is a mechanism used by HTTP for serving different versions of a resource at the same URI, so that user agents can specify which version fits their capabilities the best (e.g., language, file format). The server selects the appropriate content based on the user agent's requirements, usually provided in the HTTP headers.

2. **What are request methods and headers?**
   - Request methods in HTTP are used to indicate the desired action to be performed on a resource. The most common methods include GET, POST, PUT, DELETE, and HEAD. Headers, on the other hand, are key-value pairs in an HTTP request that provide information about the request context and about the client itself.

3. **Why is Idempotency important?**
   - Idempotency in HTTP methods ensures that multiple identical requests will have the same effect as a single request. This is important for the reliability of communications over an unreliable network where requests might be repeated or lost. GET, PUT, DELETE are idempotent methods, ensuring stability in web transactions.

4. **What is included in the response header?**
   - The response header in HTTP contains metadata about the response, such as the status code indicating the result of the request, content type, cache directives, and server information. It can also contain fields like 'Set-Cookie' for managing user sessions.

5. **What is caching in HTTP?**
   - Caching in HTTP refers to the storing of web content (like HTML pages, images, files) for reuse. This reduces server load, bandwidth usage, and latency, providing faster access to frequently accessed resources.

6. **How to ensure cache consistency?**
   - Cache consistency in HTTP is maintained using headers like 'ETag', 'Last-Modified', 'Expires', and 'Cache-Control'. These headers help to determine whether the stored cache is still valid or if a new version of the resource is needed from the server.

7. **What is the HTTP Authentication Framework?**
   - The HTTP Authentication Framework is a set of mechanisms that control access to protected web resources. It involves sending a challenge from the server to the client and receiving a response containing authentication information (like username and password) in the header.

8. **What is Proxy Authentication?**
   - Proxy Authentication is similar to HTTP Authentication but occurs when a user communicates with an HTTP proxy. The proxy server requests authentication, and the client must authenticate itself to continue using the proxy.

9. **What are Content Delivery Networks (CDNs)?**
   - Content Delivery Networks (CDNs) are networks of servers used to distribute the load of delivering content. They are strategically placed in various locations to minimize latency and provide high availability and high performance for content delivery to end-users.

# Web Foundation Queries: Detailed Answers

## Answers

1. **What do the acronyms ISP, POP, and IXP stand for, and what is their purpose?**
   - ISP: Internet Service Provider, a company that provides internet access to customers.
   - POP: Point of Presence, a physical location or access point where two or more networks or communication devices share a connection.
   - IXP: Internet Exchange Point, a key infrastructure in networks where different ISPs can connect and exchange internet traffic.

2. **How are the terms URI, URL, and URN defined, what is their purpose, and what is the relation between them?**
   - URI: Uniform Resource Identifier, a string of characters used to identify a resource on the Internet.
   - URL: Uniform Resource Locator, a specific type of URI that specifies the location of a resource on the Internet.
   - URN: Uniform Resource Name, a type of URI that names a resource but doesn't describe how to locate it. URLs locate, URNs name.

3. **What is the difference between a proxy, a gateway, and a tunnel server?**
   - Proxy: Acts as an intermediary for requests from clients, seeking resources from other servers.
   - Gateway: Connects two different networks and may perform conversions necessary to allow communication between devices on these networks.
   - Tunnel Server: Encapsulates traffic in a network protocol to send it over an incompatible network.

4. **Under which conditions are HTTP requests safe/idempotent? Which HTTP methods are considered safe/idempotent?**
   - Safe HTTP requests don't alter the state of the server. GET and HEAD are safe methods.
   - Idempotent methods can be called multiple times without different outcomes. PUT, DELETE, GET, HEAD, and OPTIONS are idempotent.

5. **What are the differences between PUT and POST in terms of request URI semantics, and how are they to be used?**
   - PUT: Used to update a specific resource at a known URL. Idempotent.
   - POST: Used to create a new resource or submit data to a server. The server determines the new resource's URL.

6. **Which proxy types are common on the Web, and what is their function?**
   - Forward Proxy: Sits between a client and the internet, commonly used for anonymity or bypassing filters.
   - Reverse Proxy: Sits in front of web servers and forwards client requests, used for load balancing, caching, or SSL encryption.

7. **What are the benefits of caching?**
   - Caching speeds up web browsing by storing copies of resources, reducing server load, bandwidth usage, and improving response times.

8. **How is the principle of Semantic Transparency for HTTP defined, and under which conditions is it violated by the use of caches?**
   - Semantic Transparency ensures that cache usage doesn't affect the requested content's meaning or usability. It's violated when cached data is outdated or doesn't match the server's current data.

9. **How can a server stop a proxy or client from caching a response?**
   - By using HTTP headers like 'Cache-Control: no-store' or 'Pragma: no-cache', a server can instruct proxies and clients not to cache a response.

10. **How can a cache determine if it is fresh in the absence of an Expires header? If Cache-control is missing too?**
    - Without 'Expires' or 'Cache-Control', freshness can be estimated using heuristic methods like checking the 'Last-Modified' date.

11. **How does the Basic authentication scheme for HTTP work, and under which conditions should it be used?**
    - Basic authentication sends a user ID and password with a request, encoded in Base64. It's simple but not secure unless used with HTTPS.

12. **How do CDNs work and what benefits do they offer?**
    - CDNs distribute content through a network of servers optimized for delivery speed and reliability, enhancing user experience by reducing latency and increasing resource availability.
