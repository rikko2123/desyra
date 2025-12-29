import { BrowserRouter, Routes, Route, createBrowserRouter, RouterProvider} from "react-router-dom";
import Home from "./page/Home" 
import Shop from "./page/Shop"

const router = createBrowserRouter([
  {
    path: "/",
    element: <Home/>,
  },

  {
    path: "/Shop",
    element: <Shop/>,
  },

  {
    path: "/about-us",
    element: <Shop/>,
  }

  
])

function App() {
  return <RouterProvider router={router} />;
}

export default App

