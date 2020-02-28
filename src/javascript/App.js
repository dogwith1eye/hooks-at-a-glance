import React from "react";
import Counter from "./Counter";
import CounterEffect from "./CounterEffect";
import SelfDestruct from "./SelfDestruct";
import FriendStatus from "./FriendStatus";

function App() {
  const friend = { friend: { id: 1 } };
  return (
    <div>
      <h1>My App</h1>
      <Counter />
      <CounterEffect />
      <SelfDestruct expirationDate={new Date(Date.now() + 5000)}>
        <FriendStatus {...friend} />
      </SelfDestruct>
    </div>
  );
}

export default App;
