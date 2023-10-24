import React from "react";
import { Route, Switch } from "react-router-dom";

const App = () => {
  return;
  <Switch>
    <Route exact path="/" component={Airlines} />
    <Route exact path="/airlines/:slug" component={Airlines} />
  </Switch>;
};

export default App;
