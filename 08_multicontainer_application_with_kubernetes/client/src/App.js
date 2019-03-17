import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter, Switch, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <h1 className="App-title">Fib calculator v2</h1>
            {/* <Link to="/">Home</Link> */}
            {/* <Link to='/otherpage'>Other Page</Link> */}
          </header>
          <div>
            <Switch>
            <Route exact path="/" component={Fib} />
            <Route path="/otherpage" component={OtherPage} />
            </Switch>
          </div>
        </div>
      </BrowserRouter>
    );
  }
}

export default App;
