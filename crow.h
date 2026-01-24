#pragma once

// Ensure that Crow uses Boost and Asio (@wolfram77)
#ifndef CROW_USE_BOOST
#define CROW_USE_BOOST
#endif

// Include Crow implementation if needed (@wolfram77)
#ifdef CROW_IMPLEMENTATION
#define CROW_MAIN
#endif

// Setup for Windows platform (@wolfram77)
// #ifdef _WIN32
// #define _WIN32_WINNT 0x0A00
// #endif

// Include the main Crow header (@wolfram77)
#include "crow/crow.h"




// Ensure that Crow uses standalone Asio (@wolfram77)
// #ifndef ASIO_STANDALONE
// #define ASIO_STANDALONE
// #define CROW_ASIO_STANDALONE_OFF
// #endif
// #ifndef BOOST_ASIO_STANDALONE
// #define BOOST_ASIO_STANDALONE
// #define CROW_BOOST_ASIO_STANDALONE_OFF
// #endif

// Restore previous state of ASIO_STANDALONE and BOOST_ASIO_STANDALONE macros (@wolfram77)
// #ifdef CROW_ASIO_STANDALONE_OFF
// #undef ASIO_STANDALONE
// #endif
// #ifdef CROW_BOOST_ASIO_STANDALONE_OFF
// #undef BOOST_ASIO_STANDALONE
// #endif
