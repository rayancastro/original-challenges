/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

const table = document.getElementsByClassName("racer_table")[0];
const lapsOne = document.getElementById("laps_one");
const lapsTwo = document.getElementById("laps_two");

const countdown = () => {
  const timer = document.getElementById("timer");
  timer.innerText = parseInt(timer.innerText, 10) - 1;
  const pointsOne = parseInt(lapsOne.innerText, 10) + (table.rows[1].querySelector(".active").cellIndex / 10);
  const pointsTwo = parseInt(lapsTwo.innerText, 10) + (table.rows[3].querySelector(".active").cellIndex / 10);
  if (timer.innerText <= 0) {
    let result = "";
    if (pointsOne === pointsTwo) {
      result = "Its a tie!!";
    } else if (pointsOne > pointsTwo) {
      result = "Player one wins!!";
    } else {
      result = "Player two wins!!";
    }
    if (!alert(result)) { window.location.reload(); }
  }
};

setInterval(countdown, 1000);
let target;
let nextTarget;
document.onkeydown = (event) => {
  switch (event.keyCode) {
    case 39:
      target = table.rows[1].querySelector(".active");
      if (target.cellIndex < 9) {
        nextTarget = table.rows[1].cells[target.cellIndex + 1];
      } else {
        nextTarget = table.rows[1].cells[0];
        lapsOne.innerText = parseInt(lapsOne.innerText, 10) + 1;
      }
      target.classList.remove("active");
      nextTarget.classList.add("active");
      break;
    case 68:
      target = table.rows[3].querySelector(".active");
      if (target.cellIndex < 9) {
        nextTarget = table.rows[3].cells[target.cellIndex + 1];
      } else {
        nextTarget = table.rows[3].cells[0];
        lapsTwo.innerText = parseInt(lapsTwo.innerText, 10) + 1;
      }
      target.classList.remove("active");
      nextTarget.classList.add("active");
      break;
    default:
  }
};


/***/ })
/******/ ]);
//# sourceMappingURL=application.js.map