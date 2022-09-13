import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor Counter {

  stable var counter = 10;

  // Get the value of the counter.
  public query func get() : async Nat {
    return counter;
  };

  // Set the value of the counter.
  public func set(n : Nat) : async () {
    counter := n;
  };

  // Increment the value of the counter.
  public func inc() : async () {
    counter += 1;
  };


  type HttpRequest = {
    body: Blob;
    headers: [HeaderField];
    method: Text;
    url: Text;
  };

  type HttpResponse = {
    body: Blob;
    headers: [HeaderField];
    status_code: Nat16; 
  };

  type HeaderField = (Text, Text);

  public query func http_request (arg: HttpRequest) : async HttpResponse{
    let val = Nat.toText(counter);
    {
      body = Text.encodeUtf8("Count:" # val # ", bye~");
      headers = [];
      status_code = 200;
    }
  };
};
