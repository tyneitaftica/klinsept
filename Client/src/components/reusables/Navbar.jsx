import { useState, useEffect, useRef } from "react";
import { useSelector, useDispatch } from "react-redux";
import { Link } from "react-router-dom";
import { FaBarsStaggered, FaMoon, FaRegSun } from "react-icons/fa6";
import { IoClose, IoSearch, IoCart } from "react-icons/io5";

import Logo from "../../assets/images/KLINSEPT_Logo.png";

import { setDarkMode } from "../../store/actions/appAction";
import "../../assets/styles/Navbar.css";

// eslint-disable-next-line react/prop-types
function Navbar({ loggedin }) {
  const [toggleMenu, setToggleMenu] = useState(false);
  const [isScrolled, setIsScrolled] = useState(false);
  const navigationRef = useRef();

  const darkMode = useSelector((state) => state.app.darkMode);

  const dispatch = useDispatch();

  useEffect(() => {
    const handleScroll = () => {
      const scrollTop = window.scrollY;
      setIsScrolled(scrollTop > 20);
    };

    window.addEventListener("scroll", handleScroll);

    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (
        navigationRef.current &&
        !navigationRef.current.contains(event.target)
      ) {
        setToggleMenu(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  return (
    <div
      className={`navbar-container backdrop-blur-sm
   ${
     !isScrolled && !toggleMenu ? "bg-transparen t" : " bg-white bg-opacity-20 "
   }`}
    >
      <nav>
        <div className="max-w-9xl mx-auto">
          <div className="flex mx-auto justify-between w-5/6 ">
            {/* Primary menu and logo */}
            <div className="flex items-center gap-16 my-7">
              {/* logo */}
              <div>
                <Link
                  to="/"
                  className="flex gap-2 font-bold text-gray-950 hover:text-yellow-500 items-center "
                >
                  <img className="h-10 w-15 " src={Logo} alt="KLINSEPT_Logo" />
                </Link>
              </div>
              {/* primary */}
              <div className="hidden lg:flex items-center gap-8 ">
                <Link to="#" className="text-black">
                  Home
                </Link>
                <Link className="text-black" to="#">
                  Products
                </Link>
                <Link className="text-black" to="#">
                  About Us
                </Link>
                <Link className="text-black" to="#">
                  Blogs
                </Link>
                <Link className="text-black" to="#">
                  Profile
                </Link>
                {/* <button>
                  {loggedin?<Link>Dashboard</Link>:<Link>Get-Started</Link>}
                  
                  
                  </button> */}
              </div>
            </div>
            {/* secondary */}
            <div className="flex gap-4">
              <div className="flex items-center">
                <div
                  className={` hover:text-yellow-500 ${
                    darkMode ? "text-white" : "text-black"
                  } `}
                  onClick={() => alert('searching')}
                >
                  <IoSearch size={25} />
                </div>
              </div>
              <div className="flex items-center">
                <button
                  className={` hover:text-yellow-500 ${
                    darkMode ? "text-white" : "text-black"
                  } `}
                  onClick={() => alert('just carting')}
                >
                  <IoCart size={25} />
                </button>
              </div>
              <div className="flex items-center">
                <div
                  className={` hover:text-yellow-500 ${
                    darkMode ? "text-white" : "text-black"
                  } `}
                  onClick={() => dispatch(setDarkMode(!darkMode))}
                >
                  {!darkMode ? <FaMoon size={25} /> : <FaRegSun size={25} />}
                </div>
              </div>
              {/* Mobile navigation toggle */}
              <div className="lg:hidden flex items-center ">
                <div
                  className={`cursor-pointer  hover:text-yellow-500  ${
                    darkMode ? "text-white" : "text-black"
                  } `}
                  onClick={() => setToggleMenu(!toggleMenu)}
                >
                  {!toggleMenu ? (
                    <FaBarsStaggered size={25} />
                  ) : (
                    <IoClose size={25} />
                  )}
                </div>
              </div>
            </div>
          </div>
        </div>
        {/* mobile navigation */}
        <div
          className={`fixed  w-full ${
            darkMode ? "bg-gray-100" : "bg-gray-100"
          } duration-100 ease-in-out bg-opacity-50 backdrop-blur-xl overflow-hidden flex flex-col lg:hidden gap-12   ${
            !toggleMenu ? "h-0" : "h-"
          }`}
        >
          <div className="pl-16 ">
            <div className="flex flex-col gap-8 font-bold tracking-wider items-start m-3">
              <Link href="#" className="">
                Home
              </Link>
              <Link href="#">products</Link>
              <Link href="#">Gallery</Link>
              <Link href="#">Contact-us</Link>
              <Link href="#">Profile</Link>
              <button>
                {loggedin ? <Link>Dashboard</Link> : <Link>Get-Started</Link>}
              </button>
            </div>
          </div>
        </div>
      </nav>
    </div>
  );
}

export default Navbar;
