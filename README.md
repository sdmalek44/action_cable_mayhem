
## Action Cable

#### Action Cable - Rails built in library for websocket connections
  - involves server side and client side components
  - data passes over a TCP connection (protocol in TCP/IP networks)
    - IP Protocol - deals with only packets
    - TCP Protocol - 2 hosts establish connection, guarantees delivery of data stream delivery in order sent
   
  - Pub/Sub - Publication/Subscription
    - as action occurs another system may be subscribed to that type of message
    - the subscription can receive an event and do something with the message
    
#### Server Side Components
  - Connections 
    - when web socket is accepted it creates a connection object
    - component handles authentication and authorization
  - Channels
    - logical separation of business
    - user can subscribe to and receive events from each channel
   
#### Client Side Components
  - Consumer
    - allows browser to create subscriptions to any of existing channels
    - also can subscribe to same channel multiple times
 
 
 #### Example 
  1. User 1 adds item to collection via regular HTTP interaction on web app
  2. User 2 is on collections index page viewing content
  3. User 1's change is saved and published through Pub/Sub process
  4. User 2's browser is subscribing to collection update events and gets published message
  5. User 2.s browser updates the collection to include the new item without User 2 having to reload the page
   
