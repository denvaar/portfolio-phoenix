!function(t){function n(r){if(e[r])return e[r].exports;var u=e[r]={i:r,l:!1,exports:{}};return t[r].call(u.exports,u,u.exports,n),u.l=!0,u.exports}var e={};n.m=t,n.c=e,n.i=function(t){return t},n.d=function(t,e,r){n.o(t,e)||Object.defineProperty(t,e,{configurable:!1,enumerable:!0,get:r})},n.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return n.d(e,"a",e),e},n.o=function(t,n){return Object.prototype.hasOwnProperty.call(t,n)},n.p="",n(n.s=201)}({119:function(t,n,e){"use strict";function r(t){var n="A"===t.tagName,e="parent"===t.getAttribute("data-submit");return n&&e}function u(t){for(;t&&t!==document&&t.nodeType===Node.ELEMENT_NODE;){if("FORM"===t.tagName)return t;t=t.parentNode}return null}function o(t){for(;t&&t.getAttribute;){if(r(t)){var n=t.getAttribute("data-confirm");return(null===n||confirm(n))&&u(t).submit(),!0}t=t.parentNode}return!1}window.addEventListener("click",function(t){if(t.target&&o(t.target))return t.preventDefault(),!1},!1)},201:function(t,n,e){e(84),e(86),t.exports=e(87)},84:function(t,n,e){"use strict";e(119)},86:function(t,n){},87:function(t,n){}});