Chromium Embedded Framework Simple Application
==============================================
A simple hello world application to get you started with CEF3.

The application shows how interfacing between web and native code is performed using chromium embedded framework (CEF).

The process is as follows: 

- Define native methods.
- Register native method with V8 using CefRegisterExtension.
- Parse the extension calls in the native C++ code using CefV8Handlers.
- Pass the response back to the web code.

The pattern basically resambles a messaging pattern.

