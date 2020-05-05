import 'bootstrap/dist/css/bootstrap.css';
import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter } from 'react-router-dom';
import App from './App';
import registerServiceWorker from './registerServiceWorker';

const baseUrl = document.getElementsByTagName('base')[0].getAttribute('href');
const rootElement = document.getElementById('root');

const loginInfo = localStorage.getItem('userdata');
if (loginInfo !== null) {
    
}

ReactDOM.render(<BrowserRouter basename={baseUrl}><App /></BrowserRouter>, rootElement);

registerServiceWorker();

