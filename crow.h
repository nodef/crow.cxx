#pragma once

// Ensure that Crow uses standalone Asio (@wolfram77)
#ifdef BOOST_ASIO_STANDALONE
#define CROW_BOOST_ASIO_STANDALONE_OLD BOOST_ASIO_STANDALONE
#undef BOOST_ASIO_STANDALONE
#endif
#define BOOST_ASIO_STANDALONE

// Include Crow implementation if needed (@wolfram77)
#ifdef CROW_IMPLEMENTATION
#define CROW_MAIN
#endif

// Include the main Crow header (@wolfram77)
#include "crow/crow.h"

// Restore previous BOOST_ASIO_STANDALONE definition if it existed (@wolfram77)
#ifdef CROW_BOOST_ASIO_STANDALONE_OLD
#define BOOST_ASIO_STANDALONE CROW_BOOST_ASIO_STANDALONE_OLD
#undef CROW_BOOST_ASIO_STANDALONE_OLD
