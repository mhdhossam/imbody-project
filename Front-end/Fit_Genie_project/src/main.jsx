import React from 'react'
import ReactDOM from 'react-dom/client'
import 'bootstrap/dist/css/bootstrap.css';
import './index.css'

import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import Home from "./pages/Home-Page";
/*import Html from './pages/html';
import Css from './pages/css';
import Home from './pages/home-page';
import JS from './pages/JS';*/
const router = createBrowserRouter([
  {
    path: "/",
  element:<Home/>,
  
  },
]);



ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
  <RouterProvider router={router} />
  </React.StrictMode>,
)
