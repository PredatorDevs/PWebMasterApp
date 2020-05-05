import React, { Component } from 'react';
import { Route } from 'react-router';
import { Layout } from './components/Layout';
import { Land } from './pages/Land';
import { Dashboard } from './pages/Dashboard';
import { Producto } from './pages/Producto';

import './custom.css'

export default class App extends Component {
  static displayName = App.name;

  render () {
    return (
      <Layout>
            <Route exact path='/' component={Land} />
            <Route exact path='/dashboard' component={Dashboard} />
            <Route exact path='/productos' component={Producto} />
      </Layout>
    );
  }
}
