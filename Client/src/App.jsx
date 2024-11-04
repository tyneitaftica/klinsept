import React,{ useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import Navbar from "./components/reusables/Navbar";

import "./assets/styles/App.css";

function App() {
  const darkMode = useSelector((state) => state.app.darkMode);
  const dispatch = useDispatch();

  return (
    <div
      className={`flex flex-col h-full  ${
        darkMode ? "bg-blue-700  " : " bg-purple-500"
      }`}
    >
      {/* <div className={`flex flex-col h-full bg-gradient-to-r ${darkMode? "from-blue-950 to-purple-950 ":"from-blue-700 to-purple-500"}`}> */}
      <Navbar />
      <div className="p-5 pt-24 min-h-[150vh]">
        <div className="container mx-auto px-4 sm:px-8 lg:px-16 xl:px-20 2xl:px-32 flex flex-col justify-center items-center gap-4 py-16 sm:py-24 md:py-32 lg:py-40 xl:py-48 2xl:py-56 text-center text-gray-900 dark:text-white">
          <h1 className="text-4xl sm:text-5xl md:text-6xl lg:text-7xl xl:text-8xl 2xl:text-9xl font-bold">
            Hello World
          </h1>
          <p className="text-xl sm:text-2xl md:text-3xl lg:text-4xl xl:text-5xl 2xl:text-6xl">
            This is a sample page.
          </p>
        </div>
        {/* Add padding to create space for Navbar */}
        <ul>
          <li>1</li>
          <li>2</li>
          <li>3</li>
          <li>4</li>
        </ul>
      </div>
    </div>
  );
}

export default App;
